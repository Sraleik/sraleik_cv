var gulp = require('gulp');
var browserSync = require('browser-sync');
var connect = require('gulp-connect-php');


gulp.task('watch',['browserSync'], function(){
  gulp.watch('./assets/css/*.css').on('change', browserSync.reload);
  gulp.watch('*.php').on('change', browserSync.reload);
});

gulp.task('browserSync', function(){
  connect.server({}, function (){
    browserSync({
      proxy: 'localhost',
      open: false
    })
  })
});
