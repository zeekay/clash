mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/clash'

module.exports =
  User:   require './models/user'
  Repo:   require './models/repo'
  Commit: require './models/commit'
  Clash:  require './models/clash'
