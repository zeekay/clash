class ContactView extends Backbone.View
  template: require '../templates/contact'
  render: ->
    $(@el).html @template()
    @

module.exports = ContactView
