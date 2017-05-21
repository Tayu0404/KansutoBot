module.exports = new Map([
  # ここから課金艦
  ["dankeruku", {
    name: "ダンケルク"
    ruby: "だんけるく"
    type: "戦艦"
    tier: 5
    premium: true
    skill: ["accurateaim"]
    basic:
      year: 1939
      displacement: 26500
      length: 214
      width: 33
      enginePower: 112500
    defence:
      hp: 29900
      armor: 808
      torpedoBulge: 859
      penetrateResistance: 13.8
      abnormalResistance: 12
    mobility:
      maxSpeed: 28.34
      timeToMaxSpeed: 18.72
      steerSpeed: 4.95
      steerTime: 18.89
    attack:
      mainGun:
        turret: 2
        burst: 4
        damage: 1100
        loadTime: 16
        range: 11.1
        penetrateRate: 9.4
        penetrateDamage: 250
        fireRate: 5
        turnSpeed: 10
      subGun:
        turret: 6
        burst: 3
        damage: 330
        loadTime: 6
        range: 6.6
        penetrateRate: 3.45
        penetrateDamage: 150
        fireRate: 2
        turnSpeed: 16
     airDefence:
       power: 510
       range: 4.2
  }]
])
