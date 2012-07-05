app = require('die')
  base: __dirname

express = require 'express'

app.extend ->
  @configure ->
    # Middleware
    @use express.bodyParser()
    @use express.methodOverride()
    @use express.cookieParser()
    @use express.session({secret: "IdfVCMnmqyrbiem1FSp"})

  @development ->
    # Connect to MongoDB, start SockJS server
    require('mongoose').connect 'mongodb://localhost/clash'
    require './sock'

  # Add routes from routes dir
  @addRoutes require './routes'

  # Capture everything else and render template
  @get '*', ->
    @render 'layout'

module.exports = app
