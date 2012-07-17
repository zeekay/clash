class App
  constructor: ->
    @collections =
      commits: require './collections/commits'
      users:   require './collections/users'
    @models =
      Clash:    require './models/clash'
      Commit:   require './models/commits'
      Repo:     require './models/repo'
      User:     require './models/user'
    @views =
      Commit:   require './views/commit'
      Commits:  require './views/commits'
      Error:    require './views/error'
      Fights:   require './views/fights'
      Home:     require './views/home'
      Leaderboard: require './views/leaderboard'
      Login:    require './views/login'
      Register: require './views/register'
      User:     require './views/user'
    @router = router = require './router'

    Backbone.history.start {pushState: true}

    # Use backbone navigate
    $(document).ready ->
      $('a').click (e) ->
        href = $(@).attr 'href'
        router.navigate(href, true)
        false

app = new App()
app.sock = require './sock'

module.exports = app
