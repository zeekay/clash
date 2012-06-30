User = require '../models/user'

class Users extends Backbone.Collection
  model: User
  url: '/api/users'

module.exports = Users
