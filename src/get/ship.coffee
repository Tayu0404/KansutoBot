shipdata = require "../data/ship/all"
util = require "../util"

module.exports = class Ship
  data: {}
  constructor: (way, val) ->
    @set(way, val)
    @addData()
    return
  set: (way, val) ->
    switch way
      when "id"
        [country, @data] = Ship.getShipFromId(val)
        @data.country = util.translateCountry(country)
      when "name"
        [country, @data] = Ship.getShipFromName(val)
        @data.country = util.translateCountry(country)
      else
        throw "invalid command"
    return
  @getShipFromId: (id) ->
    for country in shipdata.list
      list = shipdata[country]
      if list.has(id)
        return [country, list.get(id)]
    throw "not found"
    return null
  @getShipFromName: (name) ->
    for country in shipdata.list
      for v from shipdata[country].values()
        if v.name is name
          return [country, v]
        if v.ruby is name
          return [country, v]
    throw "not found"
    return null
  addData: ->
    @data.tierRoman = util.toRomanNumber(@data.tier)
    if @data.skill.length > 0
      @data.translatedSkill = (util.translateSkill(s) for s in @data.skill)
    else
      @data.translatedSkill = []
    if @data.attack.mainGun?
      do =>
        m = @data.attack.mainGun
        m.totalDmg = m.damage*m.turret*m.burst
        m.fixedDmg = (m.damage+m.damage*(m.penetrateRate/100)*((m.penetrateDamage-100)/100))*m.turret*m.burst
        m.dpm = m.fixedDmg * (60/m.loadTime)
        m.roundedFixedDmg = util.round(m.fixedDmg)
        m.roundedDpm = util.round(m.dpm)
        return
    if @data.attack.subGun?
      do =>
        s = @data.attack.subGun
        s.totalDmg = s.damage*s.turret*s.burst
        s.fixedDmg = (s.damage+s.damage*(s.penetrateRate/100)*((s.penetrateDamage-100)/100))*s.turret*s.burst
        s.dpm = s.fixedDmg * (60/s.loadTime)
        s.roundedFixedDmg = util.round(s.fixedDmg)
        s.roundedDpm = util.round(s.dpm)
        return
    if @data.attack.torpedo?
      do =>
        t = @data.attack.torpedo
        t.totalDmg = t.damage*t.turret*t.burst
        t.fixedDmg = (t.damage+t.damage*(t.penetrateRate/100)*((t.penetrateDamage-100)/100))*t.turret*t.burst
        t.dpm = t.fixedDmg * (60/t.loadTime)
        t.roundedFixedDmg = util.round(t.fixedDmg)
        t.roundedDpm = util.round(t.dpm)
        return
    if @data.attack.bomber?
      do =>
        b = @data.attack.bomber
        b.fixedDmg = (b.damage+b.damage*(b.penetrateRate/100)*((b.penetrateDamage-100)/100))
        b.roundedFixedDmg = util.round(b.fixedDmg)
        return
    if @data.attack.torpedoBomber?
      do =>
        t = @data.attack.torpedoBomber
        t.fixedDmg = (t.damage+t.damage*(t.penetrateRate/100)*((t.penetrateDamage-100)/100))
        t.roundedFixedDmg = util.round(t.fixedDmg)
        return
    if @data.airDefence?
      do =>
        a = @data.airDefence
        a.totalPower = a.power*a.range
        return
    return
