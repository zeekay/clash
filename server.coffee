#!/usr/bin/env coffee
express  = require 'express'
hemlock  = require 'hemlock'
mongoose = require 'mongoose'

module.exports = app = hemlock.createServer()

app.configure 'development', ->
  mongoose.connect 'mongodb://localhost/clash'
  app.use express.errorHandler
    dumpExceptions: true
    showStack: true
  app.use express.bodyParser()
  app.use express.cookieParser()
  app.use express.session({secret: "AIdfVCMn@3fdf;qsd;fjz.2j31123#$!FASdhp"})
  app.use express.methodOverride()

require('./routes')(app)

app.set 'view engine', 'jade'

app.get '/', (req, res) ->
  res.render 'layout'

app.get '*', (req, res) ->
  res.render 'layout'

if require.main == module
  app.run()
  require './sock'
