config = require "../config.js"

module.exports = (client) ->
  client.on("message", (mes) ->
    if mes.content.startsWith(config.prefix)
      texts = mes.content.replace(///^#{config.prefix}///, "")
      splited = texts.split(" ")
      args = splited[1..]
      client.emit("command", mes, {
        content: texts
        command: splited[0].toLowerCase()
        args: args
        texts: args.join(" ")
      })
    return
  )
  return
