# Description:
#   Utility commands for users.
#
# Commands:
#   hubot users - Reply with the list of usernames actually connected to Hubot
#   hubot call me <your name> - Hubot will call you with your new name
#   hubot what is my name? - Reply with the user name

module.exports = (robot) ->
  robot.respond /users$/i, (msg) ->
    users = []
    for id of robot.brain.users()
      users.push robot.brain.users()[id].name

    msg.send {type: 'text', body: users.join(", ")}

  robot.respond /(call me)\s?(\w+)?$/i, (msg) ->
    id = msg.message.user.id
    body = "According to my brain, your name is #{robot.brain.users()[id].name}"

    if msg.match[2]?
      robot.brain.data.users[id].name = msg.match[2]
      body = "Ok, from now on I will call you #{robot.brain.users()[id].name}"

    msg.send {type: 'text', body: body}

  robot.respond /(receive|welcome) me$/i, (msg) ->
    id = msg.message.user.id
    body = "Hello #{robot.brain.users()[id].name}, I'm #{robot.name}. Nice to meet you!"
    msg.send {type: 'text', body: body}
