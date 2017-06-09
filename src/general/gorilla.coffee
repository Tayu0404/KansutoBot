util = require "../util"

module.exports = (client) ->
  client.on("mesreply", (mes, rmes) ->
    if rmes.command is "gorilla" or rmes.command is "ゴリラ" or rmes.command is "ごりら"
      result = util.randomFromArray([
        { value: "ｳﾎｯ",    weight: 9 }
        { value: "ウホッ", weight: 9 }
        { value: "ｳﾎ",     weight: 9 }
        { value: "ウホ",   weight: 9 }
        { value: "ｳﾎﾎ",    weight: 9 }
        { value: "ウホホ", weight: 9 }
        { value: "ｳｯﾎ",    weight: 9 }
        { value: "ウッホ", weight: 9 }
        { value: "ｳﾎｰ",    weight: 9 }
        { value: "ウホー", weight: 9 }
        { value: "ｳﾎｰｳﾎﾎ", weight: 5 }
        { value: "uho",    weight: 1 }
        { value: "UHO",    weight: 1 }
        { value: "チンポ(ﾎﾞﾛﾝ", weight: 3 }
      ])
      mes.reply result
  )
  return
