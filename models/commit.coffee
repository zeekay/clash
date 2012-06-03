mongoose = require 'mongoose'

Commit = new mongoose.Schema({})

module.exports = mongoose.model 'Commit', Commit
