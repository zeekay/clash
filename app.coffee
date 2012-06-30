die  = require('die')
  base: __dirname

express  = require 'express'
mongoose = require 'mongoose'

app = die.createServer ->

  require('./routes')(@)

  @configure 'development', =>
    mongoose.connect 'mongodb://localhost/clash'
    @use express.errorHandler
      dumpExceptions: true
      showStack: true
    @use express.bodyParser()
    @use express.cookieParser()
    @use express.session({secret: "AIdfVCMn@3fdf;qsd;fjz.2j31123#$!FASdhp"})
    @use express.methodOverride()

  @set 'view engine', 'jade'

  @get '/', ->
    @render 'layout'

  # @get '*', ->
  #   @render 'layout'

module.exports = app
