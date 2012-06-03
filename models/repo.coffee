mongoose = require 'mongoose'

Repo = new mongoose.Schema
  dateAdded:
    type: Date
    default: Date.now

  created_at: Date
  description: String
  forks: Number
  language: String
  name: String
  owner: String
  size: Number
  url:
    index: true
    type: String
    unique: true
  watchers: Number

module.exports = mongoose.model 'Repo', Repo
