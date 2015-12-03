axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
records      = require 'roots-records'
templates    = require 'client-templates'
config       = require 'roots-config'

api_url = 'http://api.bycarrot.com/staff'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']

  extensions: [
    js_pipeline(files: 'assets/js/*.coffee'),
    css_pipeline(files: 'assets/css/*.styl'),
    templates(base: 'views/templates'),
    records(staff:
      url: api_url,
      hook: (res) -> res.data,
    ),
    config(api_url: api_url, static_items: 10)
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: true

  'coffee-script':
    sourcemap: true