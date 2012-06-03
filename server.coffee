#!/usr/bin/env coffee
hemlock   = require 'hemlock'

module.exports = app = hemlock.createServer()

app.set 'view engine', 'jade'

app.get '/', (req, res) ->
  res.render 'index'

app.get '*', (req, res) ->
  res.render 'index'

if require.main == module
  app.run()
