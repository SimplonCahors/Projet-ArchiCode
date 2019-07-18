"use strict";

// Load plugins
const autoprefixer = require("autoprefixer");
const cssnano = require("cssnano");
const gulp = require("gulp");
const plumber = require("gulp-plumber");
const postcss = require("gulp-postcss");
const rename = require("gulp-rename");
const sass = require("gulp-sass");
const uglify = require('gulp-uglify');
var sourcemaps = require('gulp-sourcemaps');


// SASS task
function scss() {
  return gulp
    .src("./assets/scss/style.scss", { sourcemaps: true })
    .pipe(plumber())
    .pipe(sourcemaps.init())
    .pipe(sass({ outputStyle: "expanded" }))
    .pipe(gulp.dest("./dist/css/"))
    .pipe(rename({ suffix: ".min" }))
    .pipe(postcss([autoprefixer(), cssnano()]))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest("./dist/css/"));
}

// Transpile, concatenate and minify scripts
function js() {
  return (
    gulp
      .src("./assets/js/app.js", { sourcemaps: true })
      .pipe(sourcemaps.init())
      .pipe(plumber())
      .pipe(gulp.dest("./dist/js/"))
      .pipe(uglify())
      .pipe(rename({
        basename: 'app',
        suffix: '.min'
      }))
      .pipe(sourcemaps.write())
      .pipe(gulp.dest("./dist/js/"))
  );
}

// Watch files
function watchFiles() {
  gulp.watch("./assets/scss/**/*", scss);
  gulp.watch("./assets/js/**/*", js);
}

// define complex tasks
const build = gulp.series(gulp.parallel(scss, js));
const watch = gulp.parallel(watchFiles);

// export tasks
exports.scss = scss;
exports.js = js;
exports.build = build;
exports.watch = watch;
exports.default = build;


