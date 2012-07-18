http   = require 'http'
sockjs = require 'sockjs'

sock = sockjs.createServer()

sock.on 'connection', (conn) ->
  conn.on 'data', (message) ->
    conn.write(message)
  conn.on 'close', -> return

module.exports = ->
  sock.installHandlers @, {prefix: '/sock'}
