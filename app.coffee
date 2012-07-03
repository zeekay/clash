app = require('die')
  base: __dirname

express = require 'express'

app.extend ->

  @use express.bodyParser()
  @use express.methodOverride()
  @use express.cookieParser()
  @use express.session({secret: "IdfVCMnmqyrbiem1FSp"})

  @development ->
    require('mongoose').connect 'mongodb://localhost/clash'
    require './sock'

  @get '/', ->
    @render 'layout'

  @addRoutes require './routes'

module.exports = app
