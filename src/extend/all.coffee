module.exports = (client) ->
  require("./command")(client)
  require("./reply")(client)
  require("./mesreply")(client)
  return
