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
  res.render 'layout'

app.get '*', (req, res) ->
  res.render 'layout'

app.post '/api/commit-webhook/', (req, res) ->
  console.log 'recieving commit info'
  data = ''
  req.addListener 'data', (chunk) ->
    data += chunk.toString()
  .addListener 'end', ->
    payload = JSON.parse qs.parse(data).payload

    repo = new Repo payload.repository
    repo.save (err) ->
      if err
        console.log err
      else
        console.log 'Created new Repo'

    commits = payload.commits
    for commit in commits
      console.log commit
      user = new User commit.author or commit.committer
      user.save()
      commit = new Commit commit
      commit.save (err) ->
        if err
          console.log err
        else
          console.log 'Saved new Commit'

if require.main == module
  app.run()
