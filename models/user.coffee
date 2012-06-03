mongoose = require 'mongoose'

User = new mongoose.Schema({})

module.exports = mongoose.model 'User', User
