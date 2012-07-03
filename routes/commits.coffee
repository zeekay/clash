Commit = require '../models/commit'

module.exports = ->

  # Add commit
  @post "/api/commits", ->
    commit = @body
    commit.id = Date.now().toString()
    new Commit(commit).save (err) ->
      if not err
        @json commit, 201

  # List commits
  @get "/api/commits", ->
    Commit.find {}, (err, commits) ->
      @json commits

  # Read commit
  @get "/api/commits/:id", (id) ->
    Commit.findOne {id: id}, (err, commit) ->
      @json commit

  # Update commit
  @put "/api/commits/:id", (id) ->
    commit = @body
    Commit.update {id: id}, commit, {}, (err, num) ->
      @json (if err then 404 else 200)

  # Delete commit
  @del "/api/commits/:id", (id) ->
    Commit.findOne {id: id}, (err, commit) ->
      if not err
        commit.remote()
      @json (if err then 404 else 204)
