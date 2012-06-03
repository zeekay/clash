mongoose = require 'mongoose'

User = new mongoose.Schema
  dateAdded:
    type: Date
    default: Date.now

  name:
    index: true
    type: String
    unique: true

module.exports = mongoose.model 'User', User
