TrackCollection = require 'collections/tracks'
TracksView = require 'views/TracksView'

Spinner = require 'views/Spinner'

app = require 'application'

module.exports = class Search extends Marionette.ItemView
  template: require 'views/templates/search'

  initialize: (options) ->
    console.log 'search init'
    @options = options

  events:
    'submit #search-form': 'onSubmit'

  onSubmit: (e) ->
    e.preventDefault()
    query = @$el.find('#query').val()

    @doSearch(query)

  onRender: ->
    if @options? && @options.query.length > 1
      query = @options.query
      @$el.find('#query').val(query)

      @doSearch(query)

  doSearch: (query) ->
    console.log 'performing search'

    if query.length > 0
      Backbone.history.navigate('search/'+encodeURI(query))
      app.layout.content.show new Spinner
      result = new TrackCollection request: query
      result.fetch
        success: =>
          app.layout.content.show new TracksView collection: result
