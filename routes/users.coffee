User = require '../models/user'

module.exports = (app) ->

  # Add user
  app.post "/api/users", (req, res) ->
    user = req.body
    user.id = Date.now().toString()
    new User(user).save (err) ->
      if not err
        res.json user, 201

  # List users
  app.get "/api/users", (req, res) ->
    User.find {}, (err, users) ->
      res.json users

  # Read user
  app.get "/api/users/:username", (req, res) ->
    User.findOne {username: req.params.username}, (err, user) ->
      res.json user

  # Update user
  app.put "/api/users/:username", (req, res) ->
    user = req.body
    User.update {username: req.params.username}, user, {}, (err, num) ->
      res.json (if err then 404 else 200)

  # Delete user
  app.del "/api/users/:username", (req, res) ->
    User.findOne {username: req.params.username}, (err, user) ->
      if not err
        user.remote()
      res.json (if err then 404 else 204)
