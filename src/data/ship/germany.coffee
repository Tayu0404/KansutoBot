module.exports = new Map([
  ["herugorando", {
    name: "ヘルゴランド"
    ruby: "へるごらんど"
    type: "戦艦"
    tier: 3
    premium: false
    skill: []
    basic:
      year: 1911
      displacement: 22808
      length: 167.2
      width: 28.5
      enginePower: 280000
    defence:
      hp: 26314
      armor: 749
      torpedoBulge: 707
      penetrateResistance: 13.8
      abnormalResistance: 10
    mobility:
      maxSpeed: 20.42
      timeToMaxSpeed: 17.71
      steerSpeed: 4.85
      steerTime: 17.4
    attack:
      mainGun:
        turret: 6
        burst: 2
        damage: 950
        loadTime: 16
        range: 10.14
        penetrateRate: 8.23
        penetrateDamage: 250
        fireRate: 4
        turnSpeed: 8
      subGun:
        turret: 12
        burst: 1
        damage: 360
        loadTime: 6
        range: 6.6
        penetrateRate: 3.45
        penetrateDamage: 150
        fireRate: 2
        turnSpeed: 12
     airDefence:
       power: 270
       range: 3.6
  }]
  ["kaiza", {
    name: "カイザー"
    ruby: "かいざー"
    type: "戦艦"
    tier: 4
    premium: false
    skill: []
    basic:
      year: 1912
      displacement: 24724
      length: 172.4
      width: 29
      enginePower: 310000
    defence:
      hp: 28651
      armor: 790
      torpedoBulge: 728
      penetrateResistance: 13.8
      abnormalResistance: 10
    mobility:
      maxSpeed: 22.51
      timeToMaxSpeed: 17.23
      steerSpeed: 4.65
      steerTime: 18.6
    attack:
      mainGun:
        turret: 5
        burst: 2
        damage: 950
        loadTime: 16
        range: 10.14
        penetrateRate: 8.23
        penetrateDamage: 250
        fireRate: 4
        turnSpeed: 8
      subGun:
        turret: 12
        burst: 1
        damage: 360
        loadTime: 6
        range: 6.6
        penetrateRate: 3.45
        penetrateDamage: 150
        fireRate: 2
        turnSpeed: 12
     airDefence:
       power: 270
       range: 3.6
  }]
  ["kenihi", {
    name: "ケーニヒ"
    ruby: "ひーにひ"
    type: "戦艦"
    tier: 5
    premium: false
    skill: ["accurateaim"]
    basic:
      year: 1914
      displacement: 23581
      length: 175.4
      width: 29.5
      enginePower: 43300
    defence:
      hp: 32004
      armor: 894
      torpedoBulge: 811
      penetrateResistance: 13.8
      abnormalResistance: 10
    mobility:
      maxSpeed: 26.81
      timeToMaxSpeed: 17.39
      steerSpeed: 4.95
      steerTime: 19.19
    attack:
      mainGun:
        turret: 5
        burst: 2
        damage: 950
        loadTime: 16
        range: 10.92
        penetrateRate: 8.23
        penetrateDamage: 250
        fireRate: 4
        turnSpeed: 9
      subGun:
        turret: 12
        burst: 1
        damage: 360
        loadTime: 6
        range: 6.6
        penetrateRate: 3.45
        penetrateDamage: 150
        fireRate: 2
        turnSpeed: 12
     airDefence:
       power: 420
       range: 3.6
  }]
  ["baierun", {
    name: "バイエルン"
    ruby: "ばいえるん"
    type: "戦艦"
    tier: 6
    premium: false
    skill: ["accurateaim"]
    basic:
      year: 1916
      displacement: 28530
      length: 180.3
      width: 30
      enginePower: 480000
    defence:
      hp: 37287
      armor: 998
      torpedoBulge: 998
      penetrateResistance: 16.1
      abnormalResistance: 10
    mobility:
      maxSpeed: 23.48
      timeToMaxSpeed: 19.2
      steerSpeed: 4.95
      steerTime: 19.64
    attack:
      mainGun:
        turret: 4
        burst: 2
        damage: 1350
        loadTime: 16
        range: 11.1
        penetrateRate: 10.53
        penetrateDamage: 250
        fireRate: 6
        turnSpeed: 9
      subGun:
        turret: 12
        burst: 1
        damage: 360
        loadTime: 6
        range: 6.6
        penetrateRate: 3.45
        penetrateDamage: 150
        fireRate: 2
        turnSpeed: 12
     airDefence:
       power: 510
       range: 3.96
  }]
  ["yorukudaikan", {
    name: "ヨルク代艦"
    ruby: "よるくだいかん"
    type: "戦艦"
    tier: 7
    premium: false
    skill: ["accurateaim"]
    basic:
      year: 1919
      displacement: 33500
      length: 227.8
      width: 30.4
      enginePower: 850000
    defence:
      hp: 39421
      armor: 998
      torpedoBulge: 998
      penetrateResistance: 16.1
      abnormalResistance: 12
    mobility:
      maxSpeed: 26.4
      timeToMaxSpeed: 17.76
      steerSpeed: 5.25
      steerTime: 18.88
    attack:
      mainGun:
        turret: 4
        burst: 2
        damage: 1350
        loadTime: 16
        range: 11.4
        penetrateRate: 10.58
        penetrateDamage: 250
        fireRate: 6
        turnSpeed: 9
      subGun:
        turret: 12
        burst: 1
        damage: 360
        loadTime: 6
        range: 6.6
        penetrateRate: 3.45
        penetrateDamage: 150
        fireRate: 2
        turnSpeed: 12
     airDefence:
       power: 570
       range: 3.96
  }]
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
  ["doichuranto", {
    name: "ドイッチュラント"
    ruby: "どいっちゅらんと"
    type: "戦艦"
    tier: 5
    premium: true
    skill: ["accurateaim", "attackup"]
    basic:
      year: 1931
      displacement: 11700
      length: 187.98
      width: 21.7
      enginePower: 540000
    defence:
      hp: 29769
      armor: 832
      torpedoBulge: 884
      penetrateResistance: 13.8
      abnormalResistance: 10
    mobility:
      maxSpeed: 25.42
      timeToMaxSpeed: 13.36
      steerSpeed: 5.18
      steerTime: 12.29
    attack:
      mainGun:
        turret: 2
        burst: 3
        damage: 900
        loadTime: 13
        range: 10.8
        penetrateRate: 8.23
        penetrateDamage: 225
        fireRate: 5
        turnSpeed: 12
      torpedo:
        turret: 2
        burst: 4
        damage: 2800
        loadTime: 40
        range: 5.4
        speed: 66.27
        penetrateRate: 8.16
        penetrateDamage: 125
        inudationRate: 10
        turnSpeed: 24
     airDefence:
       power: 510
       range: 3.96
  }]
])
