packagejson = require "../../package.json"

module.exports = (client) ->
  client.on("reply", (mes, rmes) ->
    if rmes.command is "version"
      mes.reply "v#{packagejson.version}"
    return
  )
  return
