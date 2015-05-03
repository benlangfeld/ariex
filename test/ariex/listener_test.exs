defmodule ARIexTest.ListenerTest do
  use ExUnit.Case

  @port :random.uniform(50000)

  test "connecting to ARI event stream" do
    server = Socket.Web.listen! @port

    spawn_link fn ->
      ARIex.Listener.listen("127.0.0.1", @port, "someuser", "somepass", "someapp")
    end

    client = server |> Socket.Web.accept!

    assert client.path == "/ari/events?api_key=someuser:somepass&app=someapp"

    client |> Socket.Web.close
  end

  test "parsing ARI events received on the socket and sending to the spawning process" do
    server = Socket.Web.listen! @port

    spawn_link fn ->
      client = server |> Socket.Web.accept!
      client |> Socket.Web.accept!
      client |> Socket.Web.send!({:text,
        ~s({"application":"hello-world",
        "type":"PlaybackStarted",
        "playback":{
          "id":"9567ea46-440f-41be-a044-6ecc8100730a",
          "media_uri":"sound:hello-world",
          "target_uri":"channel:1400609726.3",
          "language":"en",
          "state":"playing"}
        })
      })
    end

    {:ok, _} = ARIex.Listener.listen("127.0.0.1", @port, "someuser", "somepass", "someapp")

    assert_receive %{"application" => "hello-world",
      "type" => "PlaybackStarted",
      "playback" => %{
        "id" => "9567ea46-440f-41be-a044-6ecc8100730a",
        "media_uri" => "sound:hello-world",
        "target_uri" => "channel:1400609726.3",
        "language" => "en",
        "state" => "playing"
      }
    }
  end
end
