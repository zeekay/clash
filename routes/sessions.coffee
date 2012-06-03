express = require 'express'
User = require '../models/user'

loginRequired = (req, res, next) ->
  if req.session.user
    next()
  else
    res.redirect('sessions/new?redir=' + req.url)

module.exports = (app) ->
  app.post '/register', (req, res) ->
    user = new User(req.body.user)

    userSaveFailed = () ->
      req.flash('error', 'Account creation failed')
      console.log('user save failed')
      res.render 'users/new.jade',
        locals: {user: user}

    user.save (err, user) ->
      if (err)
        console.log(err)
        return userSaveFailed()
      else
        console.log user
        req.session.user = user

      req.flash('info', 'Your account has been created')
      res.redirect('/')

  app.get '/login', (req, res) ->
    res.render 'users/login',
      title: 'Login',
      redir: req.query.redir

  app.post '/sessions', (req, res) ->
    User.findOne {email: req.body.username}, (err, user) ->
      if user and user.authenticate(req.body.password)
        req.session.user_id = user.id
      else
        req.flash('error', 'Incorrect credentials')
        res.redirect('/sessions/new')

  app.del '/sessions/new', loginRequired, (req, res) ->
    if (req.session.user)
      req.session.user.destroy -> return
    res.redirect('/sessions/new')
