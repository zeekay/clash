Router = require './router'

$(document).ready ->
  window.app = new Router()
  Backbone.history.start {pushState: true}

  $('a').click (e) ->
    href = $(@).attr 'href'
    app.navigate(href, true)
    false
