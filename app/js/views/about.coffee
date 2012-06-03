class AboutView extends Backbone.View
  template: require '../templates/about'
  render: ->
    $(@el).html @template()
    @

module.exports = AboutView
