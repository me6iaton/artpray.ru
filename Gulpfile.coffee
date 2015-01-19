gulp       = require 'gulp'
watch      = require 'gulp-watch'
#bower     = require 'main-bower-files'
clean      = require 'gulp-clean'
concat     = require 'gulp-concat'
sass       = require 'gulp-sass'
sourcemaps = require 'gulp-sourcemaps'
path       = require 'path'
gif        = require 'gulp-if'
flatten    = require 'gulp-flatten'
plumber    = require 'gulp-plumber'

paths =
  public: 'static/assets/js'
  scripts:  [
    'static/assets/vendor/jquery/dist/jquery.min.js'
    'static/assets/vendor/bootstrap-sass/assets/javascripts/bootstrap.js'
    'static/assets/vendor/materialize/js/velocity.min.js'
    'static/assets/vendor/materialize/js/jquery.easing.1.3.js'
    'static/assets/vendor/materialize/js/hammer.min.js'
    'static/assets/vendor/materialize/js/jquery.hammer.js'
    'static/assets/vendor/materialize/js/sideNav.js'
    'static/assets/js/app.js'
  ]
  styles: []

# scripts
gulp.task "scripts", ->
  gulp.src paths.scripts
    .pipe(sourcemaps.init())
    .pipe concat "all.js"
    .pipe(sourcemaps.write())
    .pipe gulp.dest paths.public
#    .pipe livereload()

# default task
gulp.task "default", ['scripts']
