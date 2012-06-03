qs     = require 'querystring'
User   = require '../models/user'
Repo   = require '../models/repo'
Commit = require '../models/commit'

module.exports = (app) ->
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
