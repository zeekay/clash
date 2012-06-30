User = require '../models/user'

module.exports = ->

  # Add user
  @post "/api/users", ->
    user = req.body
    user.id = Date.now().toString()
    new User(user).save (err) ->
      if not err
        @json user, 201

  # List users
  @get "/api/users", ->
    User.find {}, (err, users) ->
      @json users

  # Read user
  @get "/api/users/:username", (username) ->
    User.findOne {username: username}, (err, user) ->
      @json user

  # Update user
  @put "/api/users/:username", (username) ->
    user = @body
    User.update {username: username}, user, {}, (err, num) ->
      @json (if err then 404 else 200)

  # Delete user
  @del "/api/users/:username", (username) ->
    User.findOne {username: username}, (err, user) ->
      if not err
        user.remote()
      @json (if err then 404 else 204)
