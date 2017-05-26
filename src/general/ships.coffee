Ship = require "../get/ship"
util = require "../util"

module.exports = (client) ->
  client.on("command", (mes, rmes) ->
    if rmes.command is "ships"
      if 12+2 <= rmes.args.length < 2
        mes.channel.send "コマンド構文に適合しません 構文は`k!help ships`を参照してください"
        return

      ships = new Map()
      len = 0
      avgTier = 0
      countType = {}
      countCountry = {}
      countName = {}
      displacementSum = 0
      countSkill = {}
      hpSum = 0
      armorSum = 0
      torpedoBulgeSum = 0
      avgPenetrateResistance = 0
      avgAbnormalResistance = 0
      minSpeed = null
      maxSpeed = null
      dpmSum = 0
      instantDmgSum = 0
      maxMainRange = 0
      maxTorpedoRange = 0
      bommerDmg = 0
      torpedoBommerDmg = 0
      airDefencePowerSum = 0
      for shipval in rmes.args[1..] when shipval isnt ""
        try
          key = rmes.args[0].toLowerCase()
          if ships.has([key, shipval])
            s = ships.get([key, shipval])
          else
            s = new Ship(key, shipval)
            s.addData()
            ships.set([key, shipval], s)
        catch e
          switch e
            when "invalid command"
              m = "コマンド構文に適合しません 構文は`k!help ships`を参照してください"
            when "not found"
              m = "戦艦が見つかりませんでした"
            else
              m = "不明なエラーが発生しました: #{e.message}\n```\n#{e.stack}\n```"
          mes.channel.send m
          return
        ship = s.data
        len++
        avgTier += ship.tier
        countType[ship.type] ?= 0
        countType[ship.type]++
        countCountry[ship.country] ?= 0
        countCountry[ship.country]++
        countName[ship.name] ?= 0
        countName[ship.name]++
        displacementSum += ship.basic.displacement
        for skill in ship.translatedSkill
          countSkill[skill] ?= 0
          countSkill[skill]++
        hpSum += ship.defence.hp
        armorSum += ship.defence.armor
        torpedoBulgeSum += ship.defence.torpedoBulge
        avgPenetrateResistance += ship.defence.penetrateResistance
        avgAbnormalResistance += ship.defence.abnormalResistance
        minSpeed ?= ship.mobility.maxSpeed
        maxSpeed ?= ship.mobility.maxSpeed
        minSpeed = Math.min(minSpeed, ship.mobility.maxSpeed)
        maxSpeed = Math.max(maxSpeed, ship.mobility.maxSpeed)
        do ->
          m = ship.attack.mainGun
          if m?
            instantDmgSum += m.fixedDmg
            dpmSum += m.dpm
            maxMainRange = Math.max(maxMainRange, m.range)
          s = ship.attack.subGun
          if s?
            instantDmgSum += s.fixedDmg
            dpmSum += s.dpm
          t = ship.attack.torpedo
          if t?
            instantDmgSum += t.fixedDmg
            dpmSum += t.dpm
            maxTorpedoRange = Math.max(maxTorpedoRange, t.range)
          return
        if ship.type is "空母"
          do ->
            b = ship.attack.bomber
            if b?
              bommerDmg += b.fixedDmg
            t = ship.attack.torpedoBomber
            if t?
              torpedoBommerDmg += t.fixedDmg
            return
        if ship.airDefence?
          airDefencePowerSum += ship.airDefence.totalPower
      avgTier = util.round(avgTier/len)
      avgPenetrateResistance = util.round(avgPenetrateResistance/len)
      avgAbnormalResistance = util.round(avgAbnormalResistance/len)
      maxSpeedDiff = util.round(maxSpeed - minSpeed)
      dpmSum = util.round(dpmSum)
      instantDmgSum = util.round(instantDmgSum)

      res = "平均Tier #{avgTier}\n"

      res += "種別:"
      for type, val of countType
        res += " #{type}#{val}"
      res += "\n国:"
      for type, val of countCountry
        res += " #{type}#{val}"
      res += "\n艦名:"
      for type, val of countName
        res += " #{type}#{val}"
      res += "\n```"

      res += "合計排水量: #{displacementSum}\n"

      res += "スキル:"
      for type, val of countSkill
        res += " #{type}#{val}"
      res += "\n"

      res += "合計HP: #{hpSum} 合計装甲: #{armorSum} 合計対水雷バルジ: #{torpedoBulgeSum}\n"
      res += "平均貫通抵抗: #{avgPenetrateResistance}% 平均異常状態抵抗: #{avgAbnormalResistance} 最大速度差: #{maxSpeedDiff}nt\n"

      res += "合計DPM: #{dpmSum} 合計瞬間火力: #{instantDmgSum}\n"
      res += "最大主砲射程: #{maxMainRange}km 最大魚雷射程: #{maxTorpedoRange}km\n"
      res += "爆撃機単発ダメージ: #{bommerDmg} 雷撃機単発ダメージ: #{torpedoBommerDmg}\n"

      res += "合計防空総合火力: #{airDefencePowerSum}\n"

      res += "```"

      mes.channel.send(res)
    return
  )
  return
