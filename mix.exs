defmodule ARIex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ARIex,
      version: "0.0.1",
      elixir: "~> 1.0",
      deps: deps,
      package: package,
      name: "ARIex",
      source_url: "https://github.com/benlangfeld/ariex",
      homepage_url: "https://hex.pm/packages/ariex",
      description: "A client for Asterisk ARI in Elixir"
    ]
  end

  def application do
    [
      applications: [
        :logger,
        :httpoison,
        :socket,
      ]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.6"}, # For executing commands against Asterisk
      {:socket, "~> 0.2"}, # For reading Asterisk events via WebSocket
    ]
  end

  defp package do
    [
      contributors: ["Ben Langfeld"],
      licenses: ["MIT"],
      links: %{
        github: "https://github.com/benlangfeld/ariex"
      }
    ]
  end
end
