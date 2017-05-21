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
    return ""
