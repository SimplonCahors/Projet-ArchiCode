var gulp = require('gulp');
var sass = require('gulp-sass');
var cleanCSS = require('gulp-clean-css');
var minify = require('gulp-minify');

gulp.task('default', ['compress','sass'], function() {});

/***** lance gulp avec toutes les fonctions ****/
gulp.task('watch', ['compress','sass'], function() {
	gulp.watch('assets/scss/*.scss', ['sass']);
  gulp.watch('assets/scss/components/*.scss', ['sass']);
  gulp.watch('assets/scss/component/*.scss', ['sass']);
  gulp.watch('assets/scss/global/*.scss', ['sass']);
  gulp.watch('assets/scss/jquery-ui/*.scss', ['sass']);
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


