http   = require 'http'
sockjs = require 'sockjs'

sock = sockjs.createServer
  log: (severity, line) ->
      line = line.split ' '
      if line[0] != 'SockJS'
        status = line.pop()
        time = line.pop()
        line.push status
        line.push time
        console.log line.join(' ')

sock.on 'connection', (conn) ->
  conn.on 'data', (message) ->
    conn.write(message)
  conn.on 'close', -> return

module.exports = ->
  sock.installHandlers @, {prefix: '/sock'}
