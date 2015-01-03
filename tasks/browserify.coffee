gulp = require 'gulp'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
$ = require './../config.json'

gulp.task 'browserify', ->
  browserify
    entries: ["./#{$.TEST}/test.coffee"]
    extensions: ['.coffee', '.js']
  .transform 'coffeeify'
  .bundle()
  .pipe source 'test.js'
  .pipe gulp.dest $.TEST
