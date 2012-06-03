Commit = require '../models/commit'

module.exports = (app) ->

  # Add commit
  app.post "/api/commits", (req, res) ->
    commit = req.body
    commit.id = Date.now().toString()
    new Commit(commit).save (err) ->
      if not err
        res.json commit, 201

  # List commits
  app.get "/api/commits", (req, res) ->
    Commit.find {}, (err, commits) ->
      res.json commits

  # Read commit
  app.get "/api/commits/:id", (req, res) ->
    Commit.findOne {id: req.params.id}, (err, commit) ->
      res.json commit

  # Update commit
  app.put "/api/commits/:id", (req, res) ->
    commit = req.body
    Commit.update {id: req.params.id}, commit, {}, (err, num) ->
      res.json (if err then 404 else 200)

  # Delete commit
  app.del "/api/commits/:id", (req, res) ->
    Commit.findOne {id: req.params.id}, (err, commit) ->
      if not err
        commit.remote()
      res.json (if err then 404 else 204)
