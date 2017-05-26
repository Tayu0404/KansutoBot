shipdata = require "../data/ship/all"

module.exports =
  getShipFromId: (id) ->
    for country in shipdata.list
      list = shipdata[country]
      if list.has(id)
        return list.get(id)
    return null
  getShipFromName: (name) ->
    for country in shipdata.list
      for v from shipdata[country].values()
        if v.name is name
          return v
        if v.ruby is name
          return v
    return null
