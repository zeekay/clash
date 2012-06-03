Router = require './router'

module.exports = window.app = new Router()
app.models =
  Clash:  require './models/clash'
  Commit: require './models/commit'
  Repo:   require './models/repo'
  User:   require './models/user'

$(document).ready ->
  Backbone.history.start {pushState: true}

  $('a').click (e) ->
    href = $(@).attr 'href'
    app.navigate(href, true)
    false
