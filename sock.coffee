http   = require 'http'
sockjs = require 'sockjs'

sock = sockjs.createServer()

sock.on 'connection', (conn) ->
  conn.on 'data', (message) ->
    conn.write(message)
  conn.on 'close', -> return

server = http.createServer()
server.addListener 'upgrade', (req, res) ->
  res.end()

sock.installHandlers server, {prefix: '/sock'}
server.listen 9999, '0.0.0.0'
