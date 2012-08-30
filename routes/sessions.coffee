User = require '../models/user'

loginRequired = (req, res, next) ->
  if req.session.user
    next()
  else
    res.redirect('sessions/new?redir=' + req.url)

module.exports = ->

  @post '/register', ->
    user = new User(@body.user)

    userSaveFailed = () ->
      @flash('error', 'Account creation failed')
      console.log('user save failed')
      @render 'users/new.jade',
        locals: {user: user}

    user.save (err, user) ->
      if (err)
        console.log(err)
        return userSaveFailed()
      else
        console.log user
        @session.user = user

      @flash('info', 'Your account has been created')
      res.redirect('/')

  @get '/login', ->
    @render 'users/login',
      title: 'Login',
      redir: @query.redir

  @post '/sessions', ->
    User.findOne {email: @body.username}, (err, user) ->
      if user and user.authenticate(@body.password)
        @session.user_id = user.id
      else
        @flash('error', 'Incorrect credentials')
        @redirect('/sessions/new')

  @del '/sessions/new', loginRequired, ->
    if (@session.user)
      @session.user.destroy -> return
    @redirect('/sessions/new')
