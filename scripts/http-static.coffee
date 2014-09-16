# Description:
#   Attach a static route for the built-in httpd
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# URLS:
#   /<whatever is in your ./static folder>

express = require 'express'

module.exports = (robot) ->
  robot.router.use(express.static('static'))
