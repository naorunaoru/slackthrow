Collection = require 'collections/collection'
Track      = require 'models/track'
G          = require 'globals'
app = require 'application'

module.exports = class TrackCollection extends Collection
  model: Track

  url: -> "http://json2jsonp.com/?url=http://pleer.com/browser-extension/search?q=#{@request}&callback=?"

  parse: (req) -> req.tracks

  initialize: (options) ->
    singleSelect = new Backbone.Picky.SingleSelect this
    _.extend this, singleSelect

    @request = options.request
