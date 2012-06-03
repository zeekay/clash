#!/usr/bin/env coffee
express  = require 'express'
hemlock  = require 'hemlock'
mongoose = require 'mongoose'
qs       = require 'querystring'

Commit   = require './models/commit'

module.exports = app = hemlock.createServer()

app.configure 'development', ->
  mongoose.connect 'mongodb://localhost/clash'
  app.use express.errorHandler
    dumpExceptions: true
    showStack: true

app.set 'view engine', 'jade'

app.get '/', (req, res) ->
  res.render 'index'

app.get '*', (req, res) ->
  res.render 'index'

app.post '/api/github-service-hook/', (req, res) ->
  data = ''
  req.addListener 'data', (chunk) ->
    data += chunk.toString()
  .addListener 'end', ->
    payload = qs.parse(data).payload
    commit = new Commit(JSON.parse payload).save()

if require.main == module
  app.run()
