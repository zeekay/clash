class RegisterView extends Backbone.View
  template: require '../templates/register'
  render: ->
    $(@el).html @template()
    @

module.exports = RegisterView
