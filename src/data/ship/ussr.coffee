module.exports = new Map([
  # ここから課金艦
  ["kirofu", {
    name: "キーロフ"
    ruby: "きーろふ"
    type: "巡洋艦"
    tier: 5
    premium: true
    skill: ["accurateaim", "attackup"]
    basic:
      year: 1938
      displacement: 9105
      length: 191.4
      width: 17.7
      enginePower: 113500
    defence:
      hp: 17001
      armor: 455
      torpedoBulge: 556
      penetrateResistance: 11.5
      abnormalResistance: 10
    mobility:
      maxSpeed: 34.52
      timeToMaxSpeed: 12.3
      steerSpeed: 7.04
      steerTime: 12.39
    attack:
      mainGun:
        turret: 3
        burst: 3
        damage: 660
        loadTime: 9
        range: 11.1
        penetrateRate: 4.3
        penetrateDamage: 200
        fireRate: 3
        turnSpeed: 14
      torpedo:
        turret: 3
        burst: 3
        damage: 2700
        loadTime: 35
        range: 5.1
        speed: 83.94
        penetrateRate: 8.16
        penetrateDamage: 125
        inudationRate: 12
        turnSpeed: 24
     airDefence:
       power: 510
       range: 4.2
  }]
])
