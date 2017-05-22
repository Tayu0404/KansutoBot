shipDb = require "../get/ship"
util = require "../util"

module.exports = (client) ->
  client.on("command", (mes, rmes) ->
    if rmes.command is "ships"
      switch rmes.args[0].toLowerCase()
        when "id" then ships = (shipDb.getShipFromId(ship) for ship in rmes.args[1..] when ship isnt "")
        when "name" then ships = (shipDb.getShipFromName(ship) for ship in rmes.args[1..] when ship isnt "")
        else
          mes.channel.send "不明なコマンドです"
          return

      for ship in ships when !ship?
        mes.channel.send "戦艦が見つかりませんでした"
        return

      len = ships.length
      avgTier = 0
      countType = {}
      countName = {}
      displacementSum = 0
      countSkill = {}
      hpSum = 0
      armorSum = 0
      torpedoBulgeSum = 0
      avgPenetrateResistance = 0
      avgAbnormalResistance = 0
      dpmSum = 0
      instantDmgSum = 0
      maxMainRange = 0
      maxTorpedoRange = 0
      bommerDmg = 0
      torpedoBommerDmg = 0
      airDefencePowerSum = 0
      for ship in ships
        avgTier += ship.tier
        if countType[ship.type]?
          countType[ship.type] += 1
        else
          countType[ship.type] = 1
        if countName[ship.name]?
          countName[ship.name] += 1
        else
          countName[ship.name] = 1
        displacementSum += ship.basic.displacement
        for skill in ship.skill
          s = util.translateSkill(skill)
          if countSkill[s]?
            countSkill[s] += 1
          else
            countSkill[s] = 1
        hpSum += ship.defence.hp
        armorSum += ship.defence.armor
        torpedoBulgeSum += ship.defence.torpedoBulge
        avgPenetrateResistance += ship.defence.penetrateResistance
        avgAbnormalResistance += ship.defence.abnormalResistance
        do ->
          m = ship.attack.mainGun
          if m?
            dmg = (m.damage+m.damage*(m.penetrateRate/100)*((m.penetrateDamage-100)/100))*m.turret*m.burst
            instantDmgSum += dmg
            dpmSum += dmg*(60/m.loadTime)
            maxMainRange = Math.max(maxMainRange, m.range)
          s = ship.attack.subGun
          if s?
            dmg = (s.damage+s.damage*(s.penetrateRate/100)*((s.penetrateDamage-100)/100))*s.turret*s.burst
            instantDmgSum += dmg
            dpmSum += dmg*(60/s.loadTime)
          t = ship.attack.torpedo
          if t?
            dmg = (t.damage+t.damage*(t.penetrateRate/100)*((t.penetrateDamage-100)/100))*t.turret*t.burst
            instantDmgSum += dmg
            dpmSum += dmg*(60/t.loadTime)
            maxTorpedoRange = Math.max(maxTorpedoRange, t.range)
          return
        if ship.type is "空母"
          do ->
            b = ship.attack.bomber
            if b?
              bommerDmg += (b.damage+b.damage*(b.penetrateRate/100)*((b.penetrateDamage-100)/100))
            t = ship.attack.torpedoBomber
            if t?
              torpedoBommerDmg += (t.damage+t.damage*(t.penetrateRate/100)*((t.penetrateDamage-100)/100))
            return
        if ship.airDefence?
          airDefencePowerSum += ship.airDefence.power*ship.airDefence.range
      avgTier = util.round(avgTier/len)
      avgPenetrateResistance = util.round(avgPenetrateResistance/len)
      avgAbnormalResistance = util.round(avgAbnormalResistance/len)
      dpmSum = util.round(dpmSum)
      instantDmgSum = util.round(instantDmgSum)

      res = "平均Tier #{avgTier}\n"

      res += "種別:"
      for type, val of countType
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
      res += "平均貫通抵抗: #{avgPenetrateResistance}% 平均異常状態抵抗: #{avgAbnormalResistance}%\n"

      res += "合計DPM: #{dpmSum} 合計瞬間火力: #{instantDmgSum}\n"
      res += "最大主砲射程: #{maxMainRange}km 最大魚雷射程: #{maxTorpedoRange}km\n"
      res += "爆撃機単発ダメージ: #{bommerDmg} 雷撃機単発ダメージ: #{torpedoBommerDmg}\n"

      res += "合計防空射程合計火力: #{airDefencePowerSum}\n"

      res += "```"

      mes.channel.send(res)
    return
  )
  return
