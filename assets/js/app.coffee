class App
  constructor: ->
    @collections =
      commits:     require './collections/commits'
      users:       require './collections/users'
    @models =
      Clash:       require './models/clash'
      Commit:      require './models/commit'
      Repo:        require './models/repo'
      User:        require './models/user'
    @views =
      About:       require './views/about'
      Commit:      require './views/commit'
      Commits:     require './views/commits'
      Error:       require './views/error'
      Fights:      require './views/fights'
      Home:        require './views/home'
      Leaderboard: require './views/leaderboard'
      Login:       require './views/login'
      Register:    require './views/register'
      User:        require './views/user'
    @sock =        require './sock'

  run: ->
    @router = router = require './router'
    Backbone.history.start {pushState: true}
    $(document).ready ->
      $('a').click (e) ->
        href = $(@).attr 'href'
        router.navigate(href, true)
        false

(module.exports = window.app = new App()).run()
