# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time
#   hubot your name - Reply with its own name
#   hubot adapter - Reply with the adapter name

module.exports = (robot) ->
  robot.respond /ping$/i, (msg) ->
    msg.send {type: 'text', body: 'PONG'}

  robot.respond /adapter$/i, (msg) ->
    msg.send {type: 'text', body: robot.adapterName}

  robot.respond /echo (.*)$/i, (msg) ->
    msg.send {type: 'text', body: msg.match[1]}

  robot.respond /time$/i, (msg) ->
    body = "Server time is: #{new Date()}"
    msg.send {type: 'text', body: body}

  robot.respond /.*your name$/i, (msg) ->
    body = "My name is #{robot.name}"
    msg.send {type: 'text', body: body}
