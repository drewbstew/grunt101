

module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    compass:
      dist:
        options:
          sassDir: 'sass'
          cssDir: 'css'
          environment: 'production'
    jshint:
      options:
        reporter: require 'jshint-stylish'
      build: ['Gruntfile.js', 'src/**/*.js']
    coffee:
      compile:
        files: [
          expand: true
          src: 'src/js/*.coffee'
          dest: 'dist/js/'
          ext: '.js'
        ]
    cssmin:
      options:
        banner: '/*\n <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd")' +
        ' %> \n*/\n'
      build:
        files: 'dist/css/style.min.css': 'src/css/style.css'
    uglify:
      options:
        banner: '/*\n <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd")' +
        '%> \n*/\n'
      build:
        files:
          'dist/js/magic.min.js': 'src/js/magic.js'
    watch:
      css:
        files: ['src/css/*.sass'],
        tasks: ['compass']

    # all of our configuration will go here

  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.registerTask 'default', ['jshint', 'uglify', 'cssmin', \
  'coffee', 'compass']
