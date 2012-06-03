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

app.set 'view engine', 'jade'

app.get '/', (req, res) ->
  res.render 'index'

app.get '*', (req, res) ->
  res.render 'index'

app.post '/api/commit-webhook/', (req, res) ->
  console.log 'recieving commit info'
  data = ''
  req.addListener 'data', (chunk) ->
    data += chunk.toString()
  .addListener 'end', ->
    payload = JSON.parse qs.parse(data).payload
    repo = payload.repository
    commit = new Commit payload
    commit.save ->
      console.log 'Saved new commit'

if require.main == module
  app.run()
