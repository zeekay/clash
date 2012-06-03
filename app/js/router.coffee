ErrorView   = require 'views/error'
HomeView    = require 'views/home'
ContactView = require 'views/contact'
UserView    = require 'views/user'
User        = require 'models/user'

class Router extends Backbone.Router
  routes:
    '':          'home'
    'contact':   'contact'
    'users/:id': 'userDetail'
    '*path':     'error404'

  error404: (path) ->
    view = new ErrorView()
    view.render "Ooops! I couldn't find what you were looking for!"
    $('#content').html view.el

  home: ->
    if not @homeView
      @homeView = new HomeView()
      @homeView.render()
    else
      @homeView.delegateEvents()
    $('#content').html(@homeView.el)

  contact: ->
    if not @contactView
      @contactView = new ContactView()
      @contactView.render()
    else
      @contactView.delegateEvents()
    $('#content').html(@contactView.el)

  userDetail: (id) ->
    user = new User {id: id}
    user.fetch
      sucess: (data) ->
        $('#content').html new UserView({model: data}).render().el

module.exports = Router
