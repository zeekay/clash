sock = new SockJS('http://localhost:9999/sock')

div = $('#stream')

print = (m, p) ->
  p = (p == undefined) ? '' : JSON.stringify(p)
  div.append($("<code>").text(m + ' ' + p))
  div.append($("<br>"))
  div.scrollTop(div.scrollTop()+10000)

sockjs.onopen = () ->
  print('[*] open', sock.protocol)
sockjs.onmessage = (e) ->
  print('[.] message', e.data)
sockjs.onclose = () ->
  print('[*] close')

module.exports = sock
