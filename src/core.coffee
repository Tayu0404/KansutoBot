process = require "process"
Discord = require "discord.js"
extend = require "./extend/all"
general = require "./general/all"
packagejson = require "../package.json"

client = new Discord.Client()
extend(client)
general(client)

client.on("ready", ->
  console.log "Log: ready"

  client.user.setGame("v#{packagejson.version}")
  return
)

client.login(require("../tokens.json").token)
