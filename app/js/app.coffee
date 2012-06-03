Router = require './router'

module.exports = app = new Router()

$(document).ready ->
  app.models =
    Commit = require './models/commit'
    Clash  = require './models/clash'
    User   = require './models/user'
    Repo   = require './models/repo'
  window.app = app
  Backbone.history.start {pushState: true}

  $('a').click (e) ->
    href = $(@).attr 'href'
    app.navigate(href, true)
    false
