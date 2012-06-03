class ErrorView extends Backbone.View
  template: require '../templates/error'
  render: (message = 'Sorry! Something inexplicable happened!') ->
    $(@el).html @template({message: message})
    @

module.exports = ErrorView
