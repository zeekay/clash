CommitView = require './commit'

class CommitsView extends Backbone.View
  tagName: 'ul'
  className: 'commits'

  template: require '../templates/commits'

  render: ->
    subviews = []
    for model in @collections.models
      view = new CommitView {model: model}
      view.render()
      subviews.push view

    $(@el).html @template(subviews)
    @

module.exports = CommitsView
