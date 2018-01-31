var gulp = require('gulp');
var sass = require('gulp-sass');
var cleanCSS = require('gulp-clean-css');
var minify = require('gulp-minify');




/***** lance gulp avec toutes les fonctions ****/

gulp.task('default', ['compress','sass'],function() {
	gulp.watch('assets/scss/*.scss', ['sass']);
	gulp.watch('assets/js/*.js', ['compress']);

});



/**** CSS optimisation *****/
gulp.task('sass', function () {
  return gulp.src('assets/scss/*.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('dist/css'))
    .pipe(cleanCSS({compatibility: 'ie8'}))
    .pipe(gulp.dest('dist/css')) /* necessaire pour refresh avec browser-sync **/
});
 
gulp.task('sass:watch', function () {
  gulp.watch('assets/scss/*.scss', ['sass']);
});


/***** Js opti *****/


gulp.task('compress', function() {
  gulp.src('assets/js/*.js')
    .pipe(minify({
        ext:{
            src:'.js',
            min:'.min.js'
        },
        exclude: ['tasks'],
        ignoreFiles: ['.combo.js', '-min.js']
    }))
    .pipe(gulp.dest('dist/js'))
});


