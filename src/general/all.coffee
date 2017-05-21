module.exports = (client) ->
  require("./ping")(client)
  require("./version")(client)
  require("./ship")(client)
  return
