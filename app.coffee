die  = require('die')
  base: __dirname

die.extend ->

  @addRoutes './routes'

  @configure 'development', ->
    require('mongoose').connect 'mongodb://localhost/clash'
    @use die.bodyParser()
    @use die.cookieParser()
    @use die.session({secret: "AIdfVCMn@3fdf;qsd;fjz.2j31123#$!FASdhp"})
    @use die.methodOverride()

  @set 'view engine', 'jade'

  @get '*^', ->
    @render 'layout'

module.exports = app
