{models, views} = require './app'

class Router extends Backbone.Router
  routes:
    '':            'home'
    'about':       'about'
    'fights':      'fights'
    'leaderboard': 'leaderboard'
    'login':       'login'
    'register':    'register'
    'users/:id':   'user'
    '*path':       'error404'

  about: ->
    view = new views.About()
    view.render()
    @swapContent view.el

  login: ->
    view = new views.Login()
    view.render()
    @swapContent view.el

  register: ->
    console.log 'hi'
    view = new views.Register()
    view.render()
    @swapContent view.el

  fights: ->
    view = new views.Fights()
    view.render()
    @swapContent view.el

  leaderboard: ->
    view = new views.Leaderboard()
    view.render()
    @swapContent view.el

  home: ->
    if not @homeView
      @homeView = new views.Home()
      @homeView.render()
    else
      @homeView.delegateEvents()
    @swapContent @homeView.el

  user: (id) ->
    user = new models.User id: id
    user.fetch
      success: (data) =>
        view = new views.User {model: data}
        view.render()
        @swapContent view.el

  error404: (path) ->
    view = new views.Error()
    view.render "Ooops! I couldn't find what you were looking for!"
    @swapContent view.el

  swapContent: (el) ->
    $('#content').html el

module.exports = new Router
