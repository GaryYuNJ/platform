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
        .pipe(gulp.dest(bower_target_dir + '/jquery'));

    gulp.src(bower_source_dir + '/jquery-migrate/jquery-migrate.min.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery'));

    // jQuery UI
    gulp.src(bower_source_dir + '/jquery-ui/core.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery-ui'));

    gulp.src(bower_source_dir + '/jquery-ui/minified/core.min.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery-ui'));

    gulp.src(bower_source_dir + '/jquery-ui/widget.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery-ui'));

    gulp.src(bower_source_dir + '/jquery-ui/minified/widget.min.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery-ui'));

    // jQuery Form
    gulp.src(bower_source_dir + '/jquery-form/jquery.form.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery-plugin'));

    // jQuery Validation
    gulp.src(bower_source_dir + '/jquery-validation/dist/jquery.validate.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery-plugin'));

    gulp.src(bower_source_dir + '/jquery-validation/dist/jquery.validate.min.js')
        .pipe(gulp.dest(bower_target_dir + '/jquery-plugin'));

    // slimscroll
    gulp.src(bower_source_dir + '/slimscroll/jquery.slimscroll.min.js')
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

    // Font-awesome
    gulp.src(bower_source_dir + '/font-awesome/css/**')
        .pipe(gulp.dest(bower_target_dir + '/font-awesome/css'));

    gulp.src(bower_source_dir + '/font-awesome/fonts/**')
        .pipe(gulp.dest(bower_target_dir + '/font-awesome/fonts'));

    // bootstrap-datapicker
    gulp.src(bower_source_dir + '/bootstrap-datepicker/dist/css/**')
        .pipe(gulp.dest(bower_target_dir + '/bootstrap-datepicker/css'));

    gulp.src(bower_source_dir + '/bootstrap-datepicker/dist/js/**')
        .pipe(gulp.dest(bower_target_dir + '/bootstrap-datepicker/js'));

    gulp.src(bower_source_dir + '/bootstrap-datepicker/dist/locales/**')
        .pipe(gulp.dest(bower_target_dir + '/bootstrap-datepicker/locales'));

    // file-upload
    gulp.src(bower_source_dir + '/blueimp-file-upload/css/**')
        .pipe(gulp.dest(bower_target_dir + '/jquery-file-upload/css'));

    gulp.src(bower_source_dir + '/blueimp-file-upload/js/**')
        .pipe(gulp.dest(bower_target_dir + '/jquery-file-upload/js'));

    gulp.src(bower_source_dir + '/blueimp-file-upload/img/**')
        .pipe(gulp.dest(bower_target_dir + '/jquery-file-upload/img'));

    // ztree
    gulp.src(bower_source_dir + '/z-tree.v3/css/**')
        .pipe(gulp.dest(bower_target_dir + '/ztree/css'));

    gulp.src(bower_source_dir + '/z-tree.v3/js/**')
        .pipe(gulp.dest(bower_target_dir + '/ztree/js'));

    // echarts
    gulp.src(bower_source_dir + '/echarts/dist/**')
        .pipe(gulp.dest(bower_target_dir + '/echarts'));

    // admin-lte
    gulp.src(bower_source_dir + '/admin-lte/dist/css/**')
        .pipe(gulp.dest(bower_target_dir + '/admin-lte/css'));

    gulp.src(bower_source_dir + '/admin-lte/dist/js/app.js')
        .pipe(gulp.dest(bower_target_dir + '/admin-lte/js'));

    gulp.src(bower_source_dir + '/admin-lte/dist/js/app.min.js')
        .pipe(gulp.dest(bower_target_dir + '/admin-lte/js'));

    // html5shiv
    gulp.src(bower_source_dir + '/html5shiv/dist/html5shiv.min.js')
        .pipe(gulp.dest(bower_target_dir + '/html5shiv'));

    // respond
    gulp.src(bower_source_dir + '/respond/dest/respond.min.js')
        .pipe(gulp.dest(bower_target_dir + '/respond'));

    // pace
    gulp.src(bower_source_dir + '/pace/pace*.js')
        .pipe(gulp.dest(bower_target_dir + '/pace'));

    gulp.src(bower_source_dir + '/pace/themes/blue/*')
        .pipe(gulp.dest(bower_target_dir + '/pace/themes/blue'));

    gulp.src(bower_source_dir + '/pace/themes/green/*')
        .pipe(gulp.dest(bower_target_dir + '/pace/themes/green'));

    // select2
    gulp.src(bower_source_dir + '/select2/dist/**')
        .pipe(gulp.dest(bower_target_dir + '/select2'));
});

gulp.task('clean', function(cb) {
    del([
        bower_source_dir, bower_target_dir
    ], cb);
});

gulp.task('default', sequence('bower', 'libs'));
