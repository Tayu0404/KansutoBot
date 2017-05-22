util = require "../util"

module.exports = (client) ->
  client.on("mesreply", (mes, rmes) ->
    if rmes.command is "omikuji" or rmes.command is "おみくじ"
      result = util.randomFromArray([
        { value: "大吉", weight: 1 }
        { value: "吉", weight: 2 }
        { value: "中吉", weight: 2 }
        { value: "小吉", weight: 2 }
        { value: "末吉", weight: 2 }
        { value: "凶", weight: 2 }
        { value: "大凶", weight: 1 }
      ])
      mes.reply "さんの運勢は「#{result}」です"
  )
  return
