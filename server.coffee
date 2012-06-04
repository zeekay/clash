#!/usr/bin/env coffee
express  = require 'express'
hemlock  = require 'hemlock'
mongoose = require 'mongoose'

module.exports = app = hemlock ->

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

  @get '/', (req, res) ->
    res.render 'layout'

  @get '*', (req, res) ->
    res.render 'layout'

if require.main == module
  app.run()
  require './sock'
