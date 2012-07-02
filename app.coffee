app  = require('die')
  base: __dirname

app.configure ->
  @addRoutes './routes'

  @use die.bodyParser()
  @use die.cookieParser()
  @use die.methodOverride()

  @development ->
    require('mongoose').connect 'mongodb://localhost/clash'
    @use die.session({secret: "IdfVCMnmqyrbiem1FSp"})

  @production ->
    require('mongoose').connect 'mongodb://clash.io/clash'
    @use die.session({secret: "zvnqEf1jxzzafdsfage"})

  @set 'view engine', 'jade'

  @get '*', ->
    @render 'layout'

module.exports = app
