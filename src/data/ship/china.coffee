module.exports = new Map([
  # ここから課金艦
  ["teien", {
    name: "定遠"
    ruby: "ていえん"
    type: "戦艦"
    tier: 1
    premium: true
    skill: []
    basic:
      year: 1884
      displacement: 7335
      length: 94.5
      width: 18
      enginePower: 6000
    defence:
      hp: 15120
      armor: 606
      torpedoBulge: 455
      penetrateResistance: 11.5
      abnormalResistance: 10
    mobility:
      maxSpeed: 17.51
      timeToMaxSpeed: 14.16
      steerSpeed: 5.4
      steerTime: 14.86
    attack:
      mainGun:
        turret: 2
        burst: 2
        damage: 800
        loadTime: 12
        range: 9
        penetrateRate: 8.23
        penetrateDamage: 250
        fireRate: 5
        turnSpeed: 16
      subGun:
        turret: 2
        burst: 1
        damage: 300
        loadTime: 5
        range: 6
        penetrateRate: 3.45
        penetrateDamage: 150
        fireRate: 2
        turnSpeed: 24
  }]
  ["jukei", {
    name: "重慶"
    ruby: "じゅうけい"
    type: "巡洋艦"
    tier: 3
    premium: true
    skill: ["airattack"]
    basic:
      year: 1937
      displacement: 5270
      length: 154.22
      width: 15.54
      enginePower: 64000
    defence:
      hp: 14456
      armor: 455
      torpedoBulge: 455
      penetrateResistance: 11.5
      abnormalResistance: 10
    mobility:
      maxSpeed: 31.42
      timeToMaxSpeed: 9.23
      steerSpeed: 8.72
      steerTime: 6.67
    attack:
      mainGun:
        turret: 3
        burst: 2
        damage: 480
        loadTime: 7
        range: 8.7
        penetrateRate: 3.23
        penetrateDamage: 150
        fireRate: 2
        turnSpeed: 18
      torpedo:
        turret: 2
        burst: 3
        damage: 3200
        loadTime: 40
        range: 6.3
        speed: 78.05
        penetrateRate: 8.16
        penetrateDamage: 125
        inudationRate: 14
        turnSpeed: 30
     airDefence:
       power: 450
       range: 4.2
  }]
  ["anzan", {
    name: "鞍山"
    ruby: "あんざん"
    type: "駆逐艦"
    tier: 4
    premium: true
    skill: ["engineboost"]
    basic:
      year: 1942
      displacement: 1425
      length: 103.2
      width: 10.8
      enginePower: 16000
    defence:
      hp: 13600
      armor: 450
      torpedoBulge: 450
      penetrateResistance: 11.5
      abnormalResistance: 10
    mobility:
      maxSpeed: 36.3
      timeToMaxSpeed: 6.93
      steerSpeed: 7.5
      steerTime: 3.67
    attack:
      mainGun:
        turret: 4
        burst: 1
        damage: 390
        loadTime: 6
        range: 7.8
        penetrateRate: 3.23
        penetrateDamage: 150
        fireRate: 3
        turnSpeed: 18
      torpedo:
        turret: 2
        burst: 3
        damage: 2700
        loadTime: 35
        range: 3.6
        speed: 83.94
        penetrateRate: 7.14
        penetrateDamage: 125
        inudationRate: 12
        turnSpeed: 24.36
     airDefence:
       power: 360
       range: 3.96
  }]
])
