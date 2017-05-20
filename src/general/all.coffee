module.exports = (client) ->
  require("./ping")(client)
  require("./version")(client)
  return
