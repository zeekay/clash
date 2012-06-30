views = require './views'
User = require './models/user'

class Router extends Backbone.Router
  routes:
    '':                'home'
    'about':           'about'
    'fights':          'fights'
    'leaderboard':     'leaderboard'
    'login':           'login'
    'register':        'register'
    'users/:username': 'user'
    '*path':           'error404'

  about: ->
    view = new views.AboutView()
    view.render()
    @swapContent view.el

  login: ->
    view = new views.LoginView()
    view.render()
    @swapContent view.el

  register: ->
    console.log 'hi'
    view = new views.RegisterView()
    view.render()
    @swapContent view.el

  fights: ->
    view = new views.FightsView()
    view.render()
    @swapContent view.el

  leaderboard: ->
    view = new views.LeaderboardView()
    view.render()
    @swapContent view.el

  home: ->
    if not @homeView
      @homeView = new views.HomeView()
      @homeView.render()
    else
      @homeView.delegateEvents()
    @swapContent @homeView.el

  user: (username) ->
    user = new User {username: username}
    user.fetch
      success: (data) =>
        view = new views.UserView {model: data}
        view.render()
        @swapContent view.el

  error404: (path) ->
    view = new views.ErrorView()
    view.render "Ooops! I couldn't find what you were looking for!"
    @swapContent view.el

  swapContent: (el) ->
    $('#content').html el

module.exports = new Router
