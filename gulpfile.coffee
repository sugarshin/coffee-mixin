gulp = require 'gulp'
browserSync = require 'browser-sync'
sequence = require 'gulp-sequence'
requireDir = require 'require-dir'
$ = require './config.json'

requireDir './tasks'



gulp.task 'serve', ->
  browserSync
    startPath: '/test/'
    server:
      baseDir: './'

gulp.task 'test', sequence 'browserify', 'serve'

gulp.task 'major', sequence 'bump-major', 'header'
gulp.task 'minor', sequence 'bump-minor', 'header'
gulp.task 'patch', sequence 'bump-patch', 'header'
