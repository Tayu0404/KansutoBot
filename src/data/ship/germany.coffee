module.exports = new Map([
  # ここから課金艦
  ["kenihisuberuku", {
    name: "ケーニヒスベルク"
    ruby: "けーにひすべるく"
    type: "巡洋艦"
    tier: 4
    premium: true
    skill: []
    basic:
      year: 1927
      displacement: 6756
      length: 174
      width: 15.3
      enginePower: 68000
    defence:
      hp: 15700
      armor: 400
      torpedoBulge: 550
      penetrateResistance: 10
      abnormalResistance: 10
    mobility:
      maxSpeed: 31.68
      timeToMaxSpeed: 11.18
      steerSpeed: 8.4
      steerTime: 10.95
    attack:
      mainGun:
        turret: 3
        burst: 3
        damage: 490
        loadTime: 7
        range: 9
        penetrateRate: 3
        penetrateDamage: 150
        fireRate: 2
        turnSpeed: 18
      torpedo:
        turret: 4
        burst: 3
        damage: 2800
        loadTime: 45
        range: 5.4
        speed: 62.52
        penetrateRate: 7
        penetrateDamage: 125
        inudationRate: 10
        turnSpeed: 24
     airDefence:
       power: 420
       range: 3.96
  }]
])
