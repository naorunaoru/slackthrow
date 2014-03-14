app = require 'application'

Search = require 'views/Search'

module.exports = class Router extends Backbone.Router

  routes:
    '': 'home'

  home: =>
    app.layout.search.show new Search

