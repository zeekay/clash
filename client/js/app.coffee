class App
#   collections: require './collections/index'
#   models:      require './models/index'
  views:       require './views/index'
  router:      require './router'

  constructor: ->
    require './dom-ready'
    Backbone.history.start {pushState: true}

module.exports = app = new App()

app.sock = require './sock'
