mongoose = require 'mongoose'

User = new mongoose.Schema
  dateAdded:
    type: Date
    default: Date.now

  username:
    index: true
    type: String
    unique: true

  name: String
  email: String

module.exports = mongoose.model 'User', User
