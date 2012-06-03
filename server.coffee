#!/usr/bin/env coffee
express  = require 'express'
hemlock  = require 'hemlock'
mongoose = require 'mongoose'
qs       = require 'querystring'

User     = require './models/user'
Repo     = require './models/repo'
Commit   = require './models/commit'

module.exports = app = hemlock.createServer()

app.configure 'development', ->
  mongoose.connect 'mongodb://localhost/clash'
  app.use express.errorHandler
    dumpExceptions: true
    showStack: true

require('./routes')(app)

app.set 'view engine', 'jade'

app.get '/', (req, res) ->
  res.render 'layout'

app.get '*', (req, res) ->
  res.render 'layout'

if require.main == module
  app.run()
