TrackCollection = require 'collections/tracks'
TracksView = require 'views/TracksView'

Spinner = require 'views/Spinner'

app = require 'application'

module.exports = class Search extends Marionette.ItemView
  template: require 'views/templates/search'

  initialize: ->
    console.log 'search init'

  events:
    'submit #search-form': 'doSearch'

  doSearch: (e) ->
    e.preventDefault()
    console.log 'performing search'

    query = @$el.find('#query')

    app.layout.content.show new Spinner

    if query.val().length > 0
      result = new TrackCollection request: query.val()
      result.fetch
        success: =>
          app.layout.content.show new TracksView collection: result
