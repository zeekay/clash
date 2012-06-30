class CommitView extends Backbone.View
  tagName: 'li'
  className: 'commit'
  template: require '../templates/commit'
  render: ->
    $(@el).html @template(@model)
    @

module.exports = CommitView
