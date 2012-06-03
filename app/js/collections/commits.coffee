Commit = require '../models/commit'

class Commits extends Backbone.Collection
  model: Commit
  url: '/api/commits'

module.exports = Commits
