module.exports = (grunt) ->

  grunt.initConfig

    svgmin:
      options:
        plugins: [{
          removeViewBox: false
        }]
      files:
        expand: true
        cwd: 'img'
        src: ['**/*.svg']
        dest: 'img'
        ext: '.svg'

    stylus:
      compile:
        options:
          paths: ['css']
          use: ['nib']
          import: ['nib', 'common']
          compress: true
          urlfunc: 'embedurl'
        files:
          'css/algonquindesign-github.min.css': [
            'css/normalize.css'
            'css/setup.styl'
            'css/list-group.styl'
            'css/grid.styl'
            'css/typografier.styl'
            'css/main.styl'
            'css/*.styl'
            '!css/common.styl'
            '!css/grid-builder.styl'
          ]

    watch:
      options:
        livereload: true
      stylus:
        options:
          livereload: false
        files: ['css/*.styl']
        tasks: ['stylus']
      css:
        files: ['css/algonquindesign-github.min.css']

  require('load-grunt-tasks')(grunt)

  grunt.registerTask 'smush', [
    'svgmin'
  ]

  grunt.registerTask 'default', [
    'watch'
  ]
