app = require('die')
  base: __dirname

app.initialize ->
  require './models'

  @development ->
    require './sock'

app.configure ->
  @use @middleware.bodyParser()
  @use @middleware.cookieParser()
  @use @middleware.session secret: 'topsecret'

  @apply require './routes'

  @get '*', ->
    @render 'layout'

module.exports = app
