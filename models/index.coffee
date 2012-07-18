{options}    = require '../app'
{requireAll} = require('die').utils

mongoose = require 'mongoose'
mongoose.connect options.mongoose.url

models = {}
models[m.modelName] = m for m in requireAll __dirname
module.exports = models
