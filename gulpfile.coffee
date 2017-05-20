cp = require("child_process")
gulp = require "gulp"
del = require "del"
notify = require "gulp-notify"
plumber = require "gulp-plumber"
changed = require "gulp-changed"
coffee = require "gulp-coffee"

childProcess = null
spawnCP = ->
  childProcess?.kill()
  childProcess = cp.spawn("node", ["./bin/core.js"], {stdio: "inherit"})
  return

tasks = ["coffee"]
gulp.task "default", tasks

gulp.task "clean", (cb) ->
  return del ["./bin/**"], cb

gulp.task "watch", ["default"], ->
  gulp.watch "./src/**/*.coffee", ["coffee"]
  return

gulp.task "dev", ["default"], ->
  spawnCP()
  gulp.watch "./src/**/*.coffee", ["coffee"]
  gulp.watch "./src/**", ->
    spawnCP()
    return
  return

# compile
gulp.task "coffee", ->
  return gulp.src "./src/**/*.coffee"
    .pipe(plumber({errorHandler: notify.onError("Error: <%= error.toString() %>")}))
    .pipe(changed("./bin"))
    .pipe(coffee())
    .pipe(gulp.dest("./bin"))

