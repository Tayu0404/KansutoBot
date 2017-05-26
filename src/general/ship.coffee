Ship = require "../get/ship"

module.exports = (client) ->
  client.on("command", (mes, rmes) ->
    if rmes.command is "ship"
      if rmes.args.length < 2
        mes.channel.send "コマンド構文に適合しません 構文は`k!help ship`を参照してください"
        return
      try
        s = new Ship(rmes.args[0].toLowerCase(), rmes.args[1])
      catch e
        switch e
          when "invalid command"
            m = "コマンド構文に適合しません 構文は`k!help ship`を参照してください"
          when "not found"
            m = "戦艦が見つかりませんでした"
          else
            m = "不明なエラーが発生しました: #{e.message}\n```\n#{e.stack}\n```"
        mes.channel.send m
        return
      s.addData()
      ship = s.data

      res = "Tier#{ship.tierRoman} "
      if ship.premium
        res += "プレミアム"
      res += " #{ship.country} #{ship.type} #{ship.name}(#{ship.ruby})\n"

      res += do ->
        b = ship.basic
        return """
          ```
          #{b.year}建造 排水量: #{b.displacement}t
          全長: #{b.length}m 横幅: #{b.width}m
          エンジン出力: #{b.enginePower}hp\n
        """

      if ship.skill.length > 0
        res += "スキル: #{ship.translatedSkill.join(", ")}\n"

      res += do ->
        d = ship.defence
        return """
          HP: #{d.hp} 装甲: #{d.armor} 対水雷バルジ: #{d.torpedoBulge}
          貫通抵抗: #{d.penetrateResistance}% 異常状態抵抗: #{d.abnormalResistance}%\n
        """

      res += do ->
        m = ship.mobility
        return """
          最高速度: #{m.maxSpeed}kt 最高速到達時間: #{m.timeToMaxSpeed}s
          旋回速度: #{m.steerSpeed}°/s 旋回時間: #{m.steerTime}s\n
        """

      if ship.attack.mainGun?
        res += do ->
          m = ship.attack.mainGun
          return """
            --主砲--
            砲塔: #{m.turret}個 同時発射数: #{m.burst}個
            単発ダメージ: #{m.damage} 装填時間: #{m.loadTime}s
            射程: #{m.range}km 貫通率: #{m.penetrateRate}% 貫通ダメージ: #{m.penetrateDamage}%
            火災発生率: #{m.fireRate}% 旋回速度: #{m.turnSpeed}
            合計ダメージ: #{m.totalDmg} 合計調整ダメージ: #{m.roundedFixedDmg} DPM: #{m.roundedDpm}\n
          """
      if ship.attack.subGun?
        res += do ->
          s = ship.attack.subGun
          return """
            --副砲--
            砲塔: #{s.turret}個 同時発射数: #{s.burst}個
            単発ダメージ: #{s.damage} 装填時間: #{s.loadTime}s
            射程: #{s.range}km 貫通率: #{s.penetrateRate}% 貫通ダメージ: #{s.penetrateDamage}%
            火災発生率: #{s.fireRate}% 旋回速度: #{s.turnSpeed}
            合計ダメージ: #{s.totalDmg} 合計調整ダメージ: #{s.roundedFixedDmg} DPM: #{s.roundedDpm}\n
          """
      if ship.attack.torpedo?
        res += do ->
          t = ship.attack.torpedo
          return """
            --魚雷--
            魚雷管: #{t.turret}個 同時発射数: #{t.burst}個
            単発ダメージ: #{t.damage} 装填時間: #{t.loadTime}s
            射程: #{t.range}km 速度: #{t.speed}nt
            貫通率: #{t.penetrateRate}% 貫通ダメージ: #{t.penetrateDamage}%
            浸水発生率: #{t.inudationRate}% 旋回速度: #{t.turnSpeed}
            合計ダメージ: #{t.totalDmg} 合計調整ダメージ: #{t.roundedFixedDmg} DPM: #{t.roundedDpm}\n
          """
      if ship.attack.bomber?
        res += do ->
          b = ship.attack.bomber
          return """
            --爆撃機--
            HP: #{b.hp} 単発ダメージ: #{b.damage} 調整ダメージ: #{b.roundedFixedDmg}
            装填時間: #{b.loadTime}s 火災発生率: #{b.fireRate}%
            貫通率: #{b.penetrateRate}% 貫通ダメージ: #{b.penetrateDamage}%\n
          """
      if ship.attack.torpedoBomber?
        res += do ->
          t = ship.attack.torpedoBomber
          return """
            --爆撃機--
            HP: #{t.hp} 単発ダメージ: #{t.damage} 調整ダメージ: #{t.roundedFixedDmg}
            射程: #{t.range}km 魚雷速度: #{t.speed}kt
            装填時間: #{t.loadTime}s 浸水発生率: #{t.inudationRate}%
            貫通率: #{t.penetrateRate}% 貫通ダメージ: #{t.penetrateDamage}%\n
          """

      if ship.airDefence?
        res += do ->
          a = ship.airDefence
          return """
            --防空--
            火力: #{a.power} 射程: #{a.range}km 総合火力: #{a.totalPower}\n
          """

      res += "```"

      mes.channel.send(res)
    return
  )
  return
