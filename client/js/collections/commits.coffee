Commit = require '../models/commit'

class Commits extends Backbone.Collection
  model: Commit
  url: '/api/commits'
  initialize: ->
    @fetch
      success: @fetchSuccess
    @deferred = new $.Deferred()

  deferred: Function.constructor::

  fetchSuccess: (collection, res) ->
    collection.deferred.resolve()

  fetchError: (collection, response) ->
      throw new Error "Products fetch did get collection from API"

module.exports = Commits
