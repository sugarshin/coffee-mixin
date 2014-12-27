gulp = require 'gulp'
runSequence = require 'run-sequence'
requireDir = require 'require-dir'
requireDir './tasks'

fileName = 'mixin'

$ =
  SRC: 'src'
  DEST: 'dest'

gulp.task 'major', -> runSequence 'bump-major', 'header'
gulp.task 'minor', -> runSequence 'bump-minor', 'header'
gulp.task 'patch', -> runSequence 'bump-patch', 'header'
