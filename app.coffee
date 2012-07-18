app = require('die')
  base: __dirname

app.extend ->
  @use @middleware.bodyParser()
  @use @middleware.methodOverride()
  @use @middleware.cookieParser()
  @use @middleware.session({secret: "IdfVCMnmqyrbiem1FSp"})

  @development ->
    require './models'
    require './sock'

  # Add routes from routes dir
  @apply require './routes'

  # Capture everything else and render template
  @get '*', ->
    @render 'layout'

module.exports = app
