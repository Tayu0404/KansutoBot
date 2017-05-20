module.exports = (client) ->
  client.on("command", (mes, rmes) ->
    rmes.send = (m) ->
      return mes.channel.send(m)
    client.emit("mesreply", mes, rmes)
  )
  client.on("reply", (mes, rmes) ->
    rmes.send = (m) ->
      return mes.reply(m)
    client.emit("mesreply", mes, rmes)
  )
  return
