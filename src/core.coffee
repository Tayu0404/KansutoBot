Discord = require "discord.js"
extend = require "./extend/all"
general = require "./general/all"

client = new Discord.Client()
extend(client)
general(client)

client.on("ready", ->
  console.log "Log: ready"
  return
)

client.login(require("../tokens.json").token)
