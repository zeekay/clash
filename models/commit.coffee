mongoose = require 'mongoose'

Commit = new mongoose.Schema
  dateAdded:
    type: Date
    default: Date.now

  added: String
  author: String
  commiter: String

  id:
    index: true
    type: String
    unique: true

  message: String
  modified: String
  removed: String
  timestamp: Date
  url: String

module.exports = mongoose.model 'Commit', Commit
