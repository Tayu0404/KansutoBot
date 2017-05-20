module.exports = (client) ->
  client.on("mesreply", (mes, rmes) ->
    if rmes.command is "ping"
      rmes.send "pong: #{client.ping}ms"
  )
  return
