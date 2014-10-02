gulp = require("gulp")
gutil = require("gulp-util")
sass = require('gulp-ruby-sass')
coffee = require("gulp-coffee")
bowerFiles = require('main-bower-files')
clean = require('gulp-rimraf')
concat = require("gulp-concat")

gulp.task "css", ->
  gulp.src("./assets/sass/styles.sass")
    .pipe(sass())
    .on("error", gutil.log)
    .pipe(gulp.dest("./static/"))

gulp.task "css:clean", ->
  gulp.src([
    "assets/*.css"
  ], read: false).pipe clean()

gulp.task "js:clean", ->
  gulp.src([
    "assets/*.js"
    "tmp/assets/*.js"
  ], read: false).pipe clean()

gulp.task "js:compile", ["js:clean"], ->
  # vendors
  gulp
    .src(bowerFiles())
    .pipe(concat("vendor.js"))
    .pipe(gulp.dest("./tmp/assets"))
    .on("error", gutil.log)

  # app
  gulp
    .src([
      "./assets/coffee/app.coffee"
    ])
    .pipe(concat("app.js")) # wrap all coffee inside a unique function
    .pipe(coffee())
    .pipe(gulp.dest("./tmp/assets"))
    .on("error", gutil.log)

gulp.task "js", ['js:compile'], ->
  gulp
    .src(["./tmp/assets/vendor.js", "./tmp/assets/app.js"])
    .pipe(concat("app.js"))
    .pipe(gulp.dest("./static"))

gulp.task "watch", ->
  gulp.watch "assets/**/*.*", ["assets"]

gulp.task "assets", [ "css", "js" ]

gulp.task "default", ["assets"]
