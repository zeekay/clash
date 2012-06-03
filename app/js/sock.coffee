sock = new SockJS('http://localhost:9999/sock')

div = $('#stream')

print = (m, p) ->
  if not p
    p = ''
  else
    p = JSON.stringify p

  div.append($("<code>").text(m + ' ' + p))
  div.append($("<br>"))
  div.scrollTop(div.scrollTop()+10000)

sock.onopen = () ->
  print('[*] open', sock.protocol)
sock.onmessage = (e) ->
  print('[.] message', e.data)
sock.onclose = () ->
  print('[*] close')

module.exports = sock
