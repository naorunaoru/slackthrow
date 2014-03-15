app = require 'application'

Search = require 'views/Search'

module.exports = class Router extends Backbone.Router

  routes:
    '': 'home'
    'search/:query': 'search'

  home: =>
    app.layout.search.show new Search


  search: (query) =>
    app.layout.search.show new Search query: query
