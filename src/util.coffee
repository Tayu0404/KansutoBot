module.exports =
  toRomanNumber: (n) ->
    switch n
      when 1 then return "I"
      when 2 then return "II"
      when 3 then return "III"
      when 4 then return "IV"
      when 5 then return "V"
      when 6 then return "VI"
      when 7 then return "VII"
      when 8 then return "VIII"
      when 9 then return "IX"
      when 10 then return "X"
    return "O"
  translateSkill: (a) ->
    switch a
      when "engineboost" then return "エンジンブースト"
      when "accurateaim" then return "精密照準"
      when "airattack" then return "防空警戒"
      when "attackup" then return "急速装填"
      when "torpedo" then return "魚雷急速装填"
    return ""
  translateCountry: (a) ->
    switch a
      when "usa" then return "アメリカ"
      when "japan" then return "日本"
      when "uk" then return "イギリス"
      when "germany" then return "ドイツ"
      when "ussr" then return "ソ連"
      when "china" then return "中国"
      when "france" then return "フランス"
    return ""
  round: (n) ->
    return Math.round(n*100)/100
  randomFromArray: (a) ->
    weightSum = 0
    for v in a
      weightSum += v.weight
    index = Math.floor(Math.random()*weightSum+1)
    weightNow = 0
    for v in a
      weightNow += v.weight
      if index <= weightNow
        return v.value
    return a[a.length-1].value
  randomFromArrayNoWeight: (a) ->
    index = Math.floor(Math.random()*a.length)
    return a[index]
