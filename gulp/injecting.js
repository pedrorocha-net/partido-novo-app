'use strict';
// gulp
var gulp = require('gulp');
var paths = gulp.paths;
var options = gulp.options;
// plugins
var $ = require('gulp-load-plugins')();
// modules
var wiredep = require('wiredep');
var mainBowerFiles = require('main-bower-files');
var coffee = require('gulp-coffee');

var cssGlobbing = require('gulp-css-globbing');

// inject app/**/*.js, bower components, css into index.html
// inject environment variables into config.js constant
gulp.task('inject-all', ['coffee','styles', 'bower-fonts-dev', 'wiredep', 'environment', 'build-vars'], function () {

  return gulp.src('app/index.html')
    .pipe(
      $.inject( // app/**/*.js files
        gulp.src('.tmp/**/*.js')
          .pipe($.plumber()) // use plumber so watch can start despite js errors
          .pipe($.naturalSort())
          .pipe($.angularFilesort()),
        {
          ignorePath: '../.tmp',
          relative: true,
        }))
    .pipe(
      $.inject( // inject compiled css
        gulp.src('.tmp/*/styles/*.css', {read: false}),
        {
          ignorePath: '../.tmp',
          relative: true,
        }))
    .pipe(gulp.dest('app'));
});

gulp.task('inject-config', function () {
  return gulp.src('app/index.html')
    .pipe(
      $.inject(
        gulp.src('app/constants/Config.constant.js'),
        {
          starttag: '<!-- inject:conf -->',
          endtag: '<!-- endinject -->',
          ignorePath: 'app',
          relative: true,
        }))
    .pipe(gulp.dest('app'));
});

// build styles to tmp
gulp.task('styles', function () {

  // compile css starting from each module's scss
  return gulp.src('app/assets/styles/main.scss')
    .pipe(cssGlobbing({ extensions: ['.scss'] }))
    .pipe($.plumber())
    .pipe($.sourcemaps.init())
    .pipe($.sass.sync().on('error', $.sass.logError))
    .pipe($.autoprefixer({ browsers: ['last 2 versions'], remove: false}))
    .pipe($.sourcemaps.write('.'))
    .pipe(gulp.dest('.tmp/assets/styles/'));
});

// build styles to tmp
gulp.task('coffee', function () {
  // compile css starting from each module's scss
  return gulp.src('app/**/*.coffee')
    .pipe(coffee())
    .pipe(gulp.dest('.tmp/'));
});

// inject bower components into index.html
gulp.task('wiredep', function () {

  return gulp.src('app/index.html')
    // exclude ionic scss since we're using ionic sass
    .pipe(wiredep.stream({exclude: ['bower_components/ionic/release/css']}))
    .pipe(gulp.dest('app/'));
});

gulp.task('bower-fonts', function () {
  // to app/main/assets/fonts (path can be set in app/main/styles/<module>.scss)
  var DEST = 'www/assets/fonts';
  var fontFiles = mainBowerFiles({filter: /\.(eot|otf|svg|ttf|woff|woff2)$/i})
    .concat('app/assets/fonts/**/*');

  return gulp.src(fontFiles)
    .pipe($.changed(DEST))
    .pipe(gulp.dest(DEST));
});


gulp.task('bower-fonts-dev', function () {
  // to app/main/assets/fonts (path can be set in app/main/styles/<module>.scss)
  var DEST = 'app/assets/fonts';
  var fontFiles = mainBowerFiles({filter: /\.(eot|otf|svg|ttf|woff|woff2)$/i})
    .concat('app/assets/fonts/**/*');

  return gulp.src(fontFiles)
    .pipe($.changed(DEST))
    .pipe(gulp.dest(DEST));
});

/**
 * transforms object into a string format that is ready for injection at indentation 4
 * @param  {Object} obj Object with values to inject
 * @return {String}     properly formatted string
 */
var injectFormat = function (obj) {
  // indentation of 2
  obj = JSON.stringify(obj, null, 2);
  // replace all doublequotes with singlequotes
  obj = obj.replace(/\"/g, '\'');
  // remove first and last line curly braces
  obj = obj.replace(/^\{\n/, '').replace(/\n\}$/, '');
  // remove indentation of first line
  obj = obj.replace(/^( ){2}/, '');
  // insert padding for all remaining lines
  obj = obj.replace(/\n( ){2}/g, '\n    ');

  return obj;
};

gulp.task('environment', function () {
  return gulp.src('app/constants/Config.constant.js')
    .pipe(
      $.inject(
        gulp.src('app/constants/env-' + options.env + '.json'),
        {
          starttag: '/*inject-env*/',
          endtag: '/*endinject*/',
          transform: function (filePath, file) {
            var json;
            try {
              json = JSON.parse(file.contents.toString('utf8'));
            }
            catch (e) {
              console.log(e);
            }

            if (json) {
              json = injectFormat(json);
            }
            return json;
          }
        }))
    .pipe(gulp.dest('app/constants/'));
});

gulp.task('build-vars', ['environment'], function () {
  return gulp.src('app/constants/Config.constant.js')
    .pipe(
      $.inject(
        gulp.src(''),
        {
          starttag: '/*inject-build*/',
          endtag: '/*endinject*/',
          transform: function () {
            var obj = {};
            var buildVars = options.buildVars;

            if (buildVars) {
              // loop over build variables
              var variables = buildVars.split(',');
              for (var i = 0, variable; ((variable = variables[i])); i++) {
                var splits = variable.split(':');
                // add key and value to object
                obj[splits[0]] = splits[1];
              }
              return injectFormat(obj);
            }
            else {
              return;
            }
          }
        }))
    .pipe(gulp.dest('app/constants/'));
});
