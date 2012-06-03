views = require './views'
User = require './models/user'

class Router extends Backbone.Router
  routes:
    '':            'home'
    'about':       'about'
    'fights':      'fights'
    'leaderboard': 'leaderboard'
    'users/:id':   'userDetail'
    '*path':       'error404'

  error404: (path) ->
    view = new views.ErrorView()
    view.render "Ooops! I couldn't find what you were looking for!"
    $('#content').html view.el

  home: ->
    if not @homeView
      @homeView = new views.HomeView()
      @homeView.render()
    else
      @homeView.delegateEvents()
    $('#content').html(@homeView.el)

  about: ->
    if not @aboutView
      @aboutView = new views.AboutView()
      @aboutView.render()
    else
      @aboutView.delegateEvents()
    $('#content').html(@aboutView.el)

  userDetail: (id) ->
    user = new User {id: id}
    user.fetch
      sucess: (data) ->
        $('#content').html new views.UserView({model: data}).render().el

module.exports = new Router
