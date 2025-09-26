module.exports = function(grunt) {

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-rename');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-rev');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['clean:v1', 'less', 'cssmin', 'uglify:dev', 'rev:all', 'rename', 'clean:v2']);
    grunt.registerTask('sev', ['clean:v1', 'less', 'cssmin', 'uglify:sev', 'rev:all', 'rename', 'clean:v2']);
    // grunt.registerTask('dev', ['clean:v1', 'uglify:update', 'watch']);

    grunt.initConfig({
        uglify: {
            dev: {
                options: {
                    sourceMap: true,
                    sourceMapName: function(dest) {
                        var parts = dest.split("/");
                        parts[parts.length - 1] = parts[parts.length - 1].replace(/\.js$/, ".map");
                        return parts.join("/");
                    },
                    beautify: true,
                    mangle: false
                },
                files: [{
                    expand: true,
                    cwd: "js/specific/",
                    src: ["**/*.js", "!**/*.min.js"],
                    dest: "js/specific/",
                    ext: ".min.js",
                    rename: function(dest, src) {

                        var pathSplit = src.split('/');

                        pathSplit[pathSplit.length - 1] = "_" + pathSplit[pathSplit.length - 2] + ".min.js";

                        return dest + pathSplit.join("/");
                    }
                }]
            },
            update: {
                options: {
                    sourceMap: true,
                    sourceMapName: function(dest) {
                        var parts = dest.split("/");
                        parts[parts.length - 1] = parts[parts.length - 1].replace(/\.js$/, ".map");
                        return parts.join("/");
                    },
                    beautify: true,
                    mangle: false
                },
                files: [{
                    expand: true,
                    cwd: "js/specific/",
                    src: ["**/*.js", "!**/*.min.js"],
                    dest: "js/specific/",
                    ext: ".min.js",
                    rename: function(dest, src) {

                        var pathSplit = src.split('/');

                        pathSplit[pathSplit.length - 1] = "_dev." + pathSplit[pathSplit.length - 2] + ".min.js";

                        return dest + pathSplit.join("/");
                    }
                }]
            },
            sev: {
                options: {
                    sourceMap: true,
                    sourceMapName: function(dest) {
                        var parts = dest.split("/");
                        parts[parts.length - 1] = parts[parts.length - 1].replace(/\.js$/, ".map");
                        return parts.join("/");
                    },
                    beautify: false,
                    mangle: true

                },
                files: [{
                    expand: true,
                    cwd: "js/specific/",
                    src: ["**/*.js", "!**/*.min.js"],
                    dest: "js/specific/",
                    ext: ".min.js",
                    rename: function(dest, src) {
                        var pathSplit = src.split('/');
                        pathSplit[pathSplit.length - 1] = "_" + pathSplit[pathSplit.length - 2] + ".min.js";

                        return dest + pathSplit.join("/");
                    }
                }]
            }
        },

        less: {
            // options: {
            //     paths: ["css/layout-admin", "css/layout-website"],
            // },
            // layoutWebUser: {
            //     files: [{
            //         expand: true,
            //         cwd: 'css/',
            //         src: ['layout-*/*.less', '!**/core/*', '!**/core/**'],
            //         dest: 'css/',
            //         ext: ".less.css",
            //         rename: function(dest, src) {
            //             var pathSplit = src.split('/');

            //             pathSplit[pathSplit.length - 1] = "$" + pathSplit[pathSplit.length - 1];

            //             return dest + pathSplit.join("/");
            //         }
            //     }]
            // },
            convertLess: {
                files: [{
                    expand: true,
                    cwd: 'css/',
                    src: ['final-css/*.less', '!**/core/*', '!**/core/**'],
                    dest: 'css/',
                    ext: ".less.css",
                    rename: function(dest, src) {
                        var pathSplit = src.split('/');
                        pathSplit[pathSplit.length - 1] = "$" + pathSplit[pathSplit.length - 1];

                        return dest + pathSplit.join("/");
                    }
                }]
            },
        },

        cssmin: {
            all: {
                expand: true,
                cwd: 'css/',
                src: ['final-css/$*.less.css'],
                ext: '.min.css',
                dest: 'css/',
                rename: function(dest, src) {
                    var pathSplit = src.split('/');

                    pathSplit[pathSplit.length - 1] = "_" + pathSplit[pathSplit.length - 2] + ".min.css";
                    return dest + pathSplit.join("/");
                }
            },
        },

        clean: {
            v1: {
                files: [{
                        src: "js/specific/**/_*.min.js"
                            // , filter : function( src ){ return src.match(/[\/\\]_[a-f0-9]{8}\./) !== null; }
                    },
                    {
                        src: ['css/final-css/*.css'],
                        // filter: function(src) { return src.match(/[\/\\]_[a-f0-9]{8}\./) !== null; }
                    },
                    { src: "js/specific/**/*.min.map" }
                ]
            },
            v2: {
                files: [
                    // {
                    // 	  src    : "js/admin/**/_*.min.js"
                    // 	, filter : function( src ){ return src.match(/[\/\\]_[a-f0-9]{8}\./) !== null; }
                    // },
                    {
                        src: ['css/final-css/$*.less.css'],
                        // filter: function(src) { return src.match(/[\/\\]_[a-f0-9]{8}\./) !== null; }
                    }
                    // ,{src    : "js/admin/**/*.min.map"}
                ]
            }
        },

        rev: {
            options: {
                algorithm: 'md5',
                length: 8
            },
            all: {
                files: [
                    { src: "css/final-css/_*.min.css" },
                    { src: "js/specific/**/_*.min.js" },
                    // { src: "js/specific/**/_*.min.map" }
                ]
            },
            // dev: {
            //     files: [
            //         { src: "css/layout-*/_*.min.css" }, { src: "js/specific/**/_*.min.js" }, { src: "js/specific/**/_*.min.map" }
            //     ]
            // }
        },

        rename: {
            assets: {
                expand: true,
                cwd: '',
                src: ['**/*._*.min.{js,css}', '**/*._*.min.map'],
                dest: '',
                rename: function(dest, src) {
                    var pathSplit = src.split('/');

                    pathSplit[pathSplit.length - 1] = "_" + pathSplit[pathSplit.length - 1].replace(/\._/, ".");

                    return dest + pathSplit.join("/");
                }
            }
        },
        watch: {
            scripts: {
                files: ['js/specific/**/*.js'],
                tasks: ['uglify:update']
            }
        }
    });

};