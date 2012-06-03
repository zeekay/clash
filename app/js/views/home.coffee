class HomeView extends Backbone.View
  template: require '../templates/home'
  render: ->
    $(@el).html @template()
    @

module.exports = HomeView
