{options}    = require '../app'
{requireAll} = require('die').utils

mongoose = require 'mongoose'
mongoose.connect options.mongoose.url

module.exports = requireAll __dirname
