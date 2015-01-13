axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
records      = require 'roots-records'
templates    = require 'client-templates'

config =
  api_url: 'http://api.bycarrot.com/staff'
  static_items: 10

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']

  extensions: [
    js_pipeline(files: 'assets/js/*.coffee'),
    css_pipeline(files: 'assets/css/*.styl'),
    records(staff: { url: config.api_url, path: 'data' }),
    templates(base: 'views/templates')
  ]

  locals:
    config: config

  stylus:
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: true

  'coffee-script':
    sourcemap: true