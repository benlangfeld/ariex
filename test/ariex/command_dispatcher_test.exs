defmodule ARIexTest.CommandDispatcherTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "get Asterisk info" do
    use_cassette "asterisk_info", match_requests_on: [:query] do
      response = ARIex.CommandDispatcher.get!("/asterisk/info", "192.168.59.103", 8088, "asterisk", "asterisk")
      assert response.body["build"]["os"] == "Linux"
    end
  end

  test "post: create a new channel" do
    use_cassette "post_new_channel", match_requests_on: [:query] do
      response = ARIex.CommandDispatcher.post!("/channels", "192.168.59.103", 8088, "asterisk", "asterisk", %{"endpoint" => "SIP/foo"})
      assert response.status_code == 200
    end
  end

  test "put: change a device state" do
    use_cassette "put_devicestate", match_requests_on: [:query] do
      response = ARIex.CommandDispatcher.put!("/deviceStates/foo", "192.168.59.103", 8088, "asterisk", "asterisk", %{"deviceState" => "busy"})
      assert response.status_code == 200
    end
  end

  test "delete: change a device state" do
    use_cassette "delete_channel", match_requests_on: [:query] do
      response = ARIex.CommandDispatcher.delete!("/channels/12345", "192.168.59.103", 8088, "asterisk", "asterisk", %{"reason" => "busy"})
      assert response.status_code == 404
      assert response.body["message"] == "Channel not found"
    end
  end
end
