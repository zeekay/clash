class UserView extends Backbone.View
  tagName: 'div'
  template: require '../templates/user'
  render: ->
    $(@el).html @template(@model.toJSON()[0])
    # summary = new UserSummaryView {model: @model}
    # $('#details', @el).html summary.render().el
    @

class UserSummaryView extends Backbone.View
  template: require '../templates/user-summary'
  initialize: ->
    @model.bind 'change', @render, @

  render: ->
    $(@el).html @template(@model.toJSON())
    @

module.exports = UserView
