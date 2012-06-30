class LoginView extends Backbone.View
  template: require '../templates/login'
  render: ->
    $(@el).html @template()
    @

module.exports = LoginView
