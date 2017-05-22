module.exports = (client) ->
  require("./ping")(client)
  require("./version")(client)
  require("./ship")(client)
  require("./ships")(client)
  require("./omikuji")(client)
  return
