app = require '../app'

class Commit extends Backbone.Model
    urlRoot: '/api/commits'

app.models?.Commit = Commit
module.exports = Commit
