gulp = require("gulp")
gutil = require("gulp-util")
sass = require('gulp-ruby-sass')
coffee = require("gulp-coffee")

gulp.task "css", ->
  gulp.src("./assets/sass/styles.sass")
    .pipe(sass())
    .on("error", gutil.log)
    .pipe(gulp.dest("./static/"))

gulp.task "js", ->
  gulp.src("./assets/coffee/app.coffee")
    .pipe(coffee())
    .on("error", gutil.log)
    .pipe(gulp.dest("./static/"))

gulp.task "watch", ->
  gulp.watch "assets/**/*.*", ["assets"]

gulp.task "assets", [ "css", "js" ]

gulp.task "default", ["assets"]
