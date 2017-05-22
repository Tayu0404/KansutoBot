module.exports = (client) ->
  client.on("command", (mes, rmes) ->
    if rmes.command is "help"
      if !rmes.args[0]?
        rmes.args[0] = ""
      switch rmes.args[0]
        when "", "help"
          reply = """
            コマンド一覧。k!help [コマンド名]で詳細ヘルプを表示できます。(例: k!help ship)
            ※印付きはリプライでも利用可能です
            ```
              k!help ヘルプを表示します
              @艦ストbot version バージョンを表示します
              k!ping pingを表示します※
              k!ship 船舶の情報を表示します
              k!ships 複数の船舶の合計情報を表示します
              k!omikuji,k!おみくじ おみくじをひけます※
            ```
          """
        when "version"
          reply = """
            バージョンを表示します
          """
        when "ping"
          reply = """
            pingを表示します
            ```
            pingはサーバーとbotとの間のレスポンス時間のことです
            ```
          """
        when "ship"
          reply = """
            船舶の情報を表示します
            ```
            コマンド形式
              k!ship name [船舶名]
              k!ship id [船舶ID(船舶名をローマ字にしたものが多いです)]
            ```
          """
        when "ships"
          reply = """
            複数の船舶の合計情報を表示します
            ```
            コマンド形式
              k!ships name [船舶名] [船舶名] [船舶名]...
              k!ships id [船舶ID(船舶名をローマ字にしたものが多いです)] [船舶ID] [船舶ID]...
            ```
          """
        when "omikuji", "おみくじ"
          reply = """
            おみくじをひけます
            ```
            大吉、吉、中吉、小吉、末吉、凶、大凶が出ます
            (左から良い方順)
            ```
          """
        else
          reply = """
            不明なコマンドです。k!helpから参照してください
          """
      mes.reply reply
    return
  )
  return
