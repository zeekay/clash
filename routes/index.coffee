fs = require 'fs'

module.exports = (app) ->
  for file in fs.readdirSync __dirname
    if file != 'index.coffee'
      require('./' + file)(app)
