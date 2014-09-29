# WUBOT: personal web based bot based on Hubot

A simple experiment to play with [Hubot](https://hubot.github.com/). It uses
[socket.io](http://socket.io) adapter and communicates through a web interface.

## Setup

* `git clone https://github.com/apeacox/wubot.git`
* `npm install`
* `./bin/hubot -a socket.io-adapter`
* point your browser to `http://127.0.0.1:8080`

## Hubot scripts

Wubot IS NOT compatible with Hubot script. At least, if you try to use them,
they will not respond as expected. The provided plugins are modified versions,
mostly because of required JSON output, instead of plain text :-)

So, if you want to try/use other existing Hubot scripts, just check some of the
provided ones.

## TODO

* better UI
* refactor JS code
* more useful plugins
