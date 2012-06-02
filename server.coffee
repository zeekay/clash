hemlock = require 'hemlock'

app = hemlock.createServer()

app.listen 3000, ->
  console.log 'Up and running: http://localhost:3000'
