class App
  collections: require './collections'
  models:      require './models'
  views:       require './views'
  router:      require './router'

  constructor: ->
    require './dom-ready'
    Backbone.history.start {pushState: true}

module.exports = app = new App()
