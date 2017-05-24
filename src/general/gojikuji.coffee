util = require "../util"

module.exports = (client) ->
  client.on("mesreply", (mes, rmes) ->
    if rmes.command is "gojikuji" or rmes.command is "ごじくじ"
      result = util.randomFromArrayNoWeight([
        "さいせんたん(最先鋒)"
        "蒼黒の土"
        "ばすう(場数)"
        "国土無双"
        "さいじょう(最上)"
        "くれは(紅葉)"
        "みなもとざえもん(源左衛門)"
      ])
      mes.reply "今日のラッキー誤字は「#{result}」だよ"
  )
  return
