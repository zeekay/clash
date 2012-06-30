$(document).ready ->
  $('a').click (e) ->
    href = $(@).attr 'href'
    app.navigate(href, true)
    false
