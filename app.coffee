app = require('die')
  base: __dirname

app.extend ->
  @addRoutes require './routes'

  @use app.bodyParser()
  @use app.cookieParser()
  @use app.methodOverride()
  @use app.session({secret: "IdfVCMnmqyrbiem1FSp"})

  @development ->
    require('mongoose').connect 'mongodb://localhost/clash'

  @get '*', ->
    @render 'layout'

module.exports = app
