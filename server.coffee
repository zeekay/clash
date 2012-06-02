hemlock = require 'hemlock'

app = hemlock.createServer()

app.listen 3000, ->
  console.log 'clash running @ http://localhost:' + app.settings.port
