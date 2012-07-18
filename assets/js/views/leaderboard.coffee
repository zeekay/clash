class LeaderboardView extends Backbone.View
  template: require '../templates/leaderboard'
  render: ->
    $(@el).html @template()
    @

module.exports = LeaderboardView
