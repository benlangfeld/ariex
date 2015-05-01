[![Build Status](https://secure.travis-ci.org/benlangfeld/ariex.png?branch=develop)](http://travis-ci.org/benlangfeld/ariex)

# ARIex

A client for Asterisk ARI in Elixir.

## Installation

## Usage

```elixir
iex(1)> Ariex.Listener.listen("192.168.59.103", 8088, "asterisk", "asterisk", "test")
{:ok, #PID<0.169.0>}
iex(2)> flush()
%{"application" => "test", "args" => [],
  "channel" => %{"accountcode" => "",
    "caller" => %{"name" => "Ben Langfeld", "number" => "6001"},
    "connected" => %{"name" => "", "number" => ""},
    "creationtime" => "2015-05-01T02:42:18.665+0000",
    "dialplan" => %{"context" => "test", "exten" => "2", "priority" => 2},
    "id" => "1430448138.7", "language" => "en", "name" => "PJSIP/6001-00000006",
    "state" => "Ring"}, "timestamp" => "2015-05-01T02:42:18.666+0000",
  "type" => "StasisStart"}
%{"application" => "test", "cause" => 127,
  "channel" => %{"accountcode" => "",
    "caller" => %{"name" => "Ben Langfeld", "number" => "6001"},
    "connected" => %{"name" => "", "number" => ""},
    "creationtime" => "2015-05-01T02:42:18.665+0000",
    "dialplan" => %{"context" => "test", "exten" => "2", "priority" => 2},
    "id" => "1430448138.7", "language" => "en", "name" => "PJSIP/6001-00000006",
    "state" => "Ring"}, "timestamp" => "2015-05-01T02:42:26.862+0000",
  "type" => "ChannelHangupRequest"}
%{"application" => "test",
  "channel" => %{"accountcode" => "",
    "caller" => %{"name" => "Ben Langfeld", "number" => "6001"},
    "connected" => %{"name" => "", "number" => ""},
    "creationtime" => "2015-05-01T02:42:18.665+0000",
    "dialplan" => %{"context" => "test", "exten" => "2", "priority" => 2},
    "id" => "1430448138.7", "language" => "en", "name" => "PJSIP/6001-00000006",
    "state" => "Ring"}, "timestamp" => "2015-05-01T02:42:26.863+0000",
  "type" => "StasisEnd"}
:ok
```

## Development

An Asterisk instance in Docker is provided. To boot, install docker-compose (http://docs.docker.com/compose/) and run `docker-compose up`.

## Links:
* [Source](https://github.com/benlangfeld/ariex)
* [Documentation](https://hex.pm/packages/ariex)
* [Bug Tracker](https://github.com/benlangfeld/ariex/issues)

## Copyright

Copyright (c) 2015 Ben Langfeld. MIT licence (see LICENSE for details).
