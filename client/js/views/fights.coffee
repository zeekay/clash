class FightsView extends Backbone.View
  template: require '../templates/fights'
  render: ->
    $(@el).html @template()
    @

module.exports = FightsView
