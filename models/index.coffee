{requireAll} = require('die').utils

mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/clash'

module.exports = requireAll __dirname
