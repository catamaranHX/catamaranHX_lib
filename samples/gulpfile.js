'use strict';
var path = require("path");
var gulp = require("gulp");
var runSequence = require('run-sequence');
var shell = require('gulp-shell');
var connect = require('gulp-connect');
var open = require('open');


gulp.task('connect', function() {
  console.log('Starting CatamaranHx');
  connect.server({
    root: ['Export/html5/bin/'],
    port: 8000,
    livereload: true
  });
  open('http://localhost:8000');
});

gulp.task('restart', function() {
  console.log('reload CatamaranHx');
  connect.reload();
});


var paths = {
    main: ["Source/**.hx", "Source/**/**.hx"]
};

gulp.task('default', function (callback) {
    gulp.start('connect');
    gulp.start('watch');

});

gulp.task('watch', function (callback) {
    gulp.watch(paths.main, ['buildwatcher', 'restart']);
});


gulp.task('buildwatcher', shell.task([
    'openfl build html5 -Dwebgl'
]));

gulp.task('install_dep', shell.task([
    'haxelib install dox',
    'haxelib install openfl', 
    'haxelib -notimeout install swf', 
    'haxelib -notimeout install svg', 
    'haxelib -notimeout install actuate', 
    'haxelib -notimeout install actuate', 
    'haxelib -notimeout git pv3d https://github.com/seacloud9/pv3dHx.git',
    'haxelib -notimeout git catamaranhx https://github.com/catamaranHX/catamaranHX_lib.git'
]));