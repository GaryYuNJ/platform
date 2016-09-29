var gulp = require('gulp'),
    less = require('gulp-less'),
    ejs = require('gulp-ejs'),
    concat = require('gulp-concat'),
    rename = require('gulp-rename'),
    uglify = require('gulp-uglify'),
    connect = require('gulp-connect'),
    bower = require('gulp-bower'),
    sequence = require('gulp-sequence'),
    del = require('del');

var bower_source_dir = 'bower_components';
var bower_target_dir = 'src/main/webapp/static/libs';

gulp.task('bower', function() {
    return bower(bower_source_dir, {});
});

gulp.task('libs', function() {
    // jQuery
    gulp.src(bower_source_dir + '/jquery/dist/jquery.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery'));

    gulp.src(bower_source_dir + '/jquery/dist/jquery.min.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery'));

    gulp.src(bower_source_dir + '/jquery/dist/jquery.min.map')
        .pipe(gulp.dest(bower_target_dir + '/jquery'));

    // jQuery Migrate
    gulp.src(bower_source_dir + '/jquery-migrate/jquery-migrate.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery-migrate'));

    gulp.src(bower_source_dir + '/jquery-migrate/jquery-migrate.min.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery-migrate'));

    // jQuery Form
    gulp.src(bower_source_dir + '/jquery-form/jquery.form.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery-plugin'));

    // jQuery Validation
    gulp.src(bower_source_dir + '/jquery-validation/dist/jquery.validate.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery-plugin'));

    gulp.src(bower_source_dir + '/jquery-validation/dist/jquery.validate.min.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery-plugin'));

    // JsRender
    gulp.src(bower_source_dir + '/jsrender/jsrender.js')
        .pipe(gulp.dest(bower_target_dir + '/jsrender'));

    gulp.src(bower_source_dir + '/jsrender/jsrender.min.js')
        .pipe(gulp.dest(bower_target_dir + '/jsrender'));

    gulp.src(bower_source_dir + '/jsrender/jsrender.min.js.map')
        .pipe(gulp.dest(bower_target_dir + '/jsrender'));

    // Bootstrap
    gulp.src(bower_source_dir + '/bootstrap/dist/**')
        .pipe(gulp.dest(bower_target_dir + '/bootstrap'));

    // smalot-bootstrap-datetimepicker
    gulp.src(bower_source_dir + '/smalot-bootstrap-datetimepicker/css/**')
        .pipe(gulp.dest(bower_target_dir + '/bootstrap-datetimepicker/css'));

    gulp.src(bower_source_dir + '/smalot-bootstrap-datetimepicker/js/**')
        .pipe(gulp.dest(bower_target_dir + '/bootstrap-datetimepicker/js'));

    // bootstrap-select
    gulp.src(bower_source_dir + '/bootstrap-select/dist/**')
        .pipe(gulp.dest(bower_target_dir + '/bootstrap-select'));

    // bootstrap-switch
    gulp.src(bower_source_dir + '/bootstrap-switch/dist/**')
        .pipe(gulp.dest(bower_target_dir + '/bootstrap-switch'));

    // bootstrap-table
    gulp.src(bower_source_dir + '/bootstrap-table/dist/**')
        .pipe(gulp.dest(bower_target_dir + '/bootstrap-table'));

    // Font-awesome
    gulp.src(bower_source_dir + '/font-awesome/css/**')
        .pipe(gulp.dest(bower_target_dir + '/font-awesome/css'));

    gulp.src(bower_source_dir + '/font-awesome/fonts/**')
        .pipe(gulp.dest(bower_target_dir + '/font-awesome/fonts'));

    // ztree
    gulp.src(bower_source_dir + '/z-tree.v3/css/**')
        .pipe(gulp.dest(bower_target_dir + '/ztree/css'));

    gulp.src(bower_source_dir + '/z-tree.v3/js/**')
        .pipe(gulp.dest(bower_target_dir + '/ztree/js'));
});
gulp.task('clean', function(cb) {
    del([
        bower_source_dir
    ], cb);
});

gulp.task('prototype-js', function() {
    watch('public/js/**/*.js', function() {
        gulp.src('public/js/**/*.js')
            .pipe(uglify())
            .pipe(gulp.dest("public/js"))
            .pipe(connect.reload())
    });
});

gulp.task('prototype-server', function() {
    connect.server({
        root : 'src/main/webapp',
        livereload : true
    });
});

gulp.task('prototype', ['prototype-js', 'prototype-server']);

gulp.task('default', sequence('bower', 'libs'));
