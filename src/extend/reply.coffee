module.exports = (client) ->
  client.on("message", (mes) ->
    if mes.isMentioned(client.user)
      texts = mes.content.replace(///^<@#{client.user.id}>\ ///, "")
      splited = texts.split(" ")
      args = splited[1..]
      client.emit("reply", mes, {
        content: texts
        command: splited[0]
        args: args
        texts: args.join(" ")
      })
    return
  )
  return
