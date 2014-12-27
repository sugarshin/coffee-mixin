gulp = require 'gulp'
header = require 'gulp-header'
bump = require 'gulp-bump'
pkg = require './package.json'

banner = """
###!
 * @license #{pkg.name} v#{pkg.version}
 * (c) #{new Date().getFullYear()} #{pkg.author} #{pkg.homepage}
 * License: #{pkg.license}
###

"""

fileName = 'mixin'

$ =
  SRC: 'src'
  DEST: 'dest'

gulp.task 'header', ->
  gulp.src "#{$.SRC}/#{fileName}.coffee"
    .pipe header(banner)
    .pipe gulp.dest("#{$.DEST}")

gulp.task 'major', ->
  gulp.src './*.json'
    .pipe bump(
      type: 'major'
    )
    .pipe gulp.dest('./')

gulp.task 'minor', ->
  gulp.src './*.json'
    .pipe bump(
      type: 'minor'
    )
    .pipe gulp.dest('./')

gulp.task 'patch', ->
  gulp.src './*.json'
    .pipe bump(
      type: 'patch'
    )
    .pipe gulp.dest('./')

gulp.task 'default', ['header']
