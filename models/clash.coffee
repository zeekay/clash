mongoose = require 'mongoose'

Clash = new mongoose.Schema
  starts:
    type: Date
  ends:
    type: Date
  repo: String
  owner: String

module.exports = mongoose.model 'Clash', Clash
