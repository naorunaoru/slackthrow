Collection = require 'collections/collection'
Track      = require 'models/track'
G          = require 'globals'
app = require 'application'

module.exports = class TrackCollection extends Collection
  model: Track

  url: -> "http://json2jsonp.com/?url=http://pleer.com/browser-extension/search?q=#{@request}&callback=?"

  parse: (req) ->
    console.log req
    return req.tracks

  initialize: (options) ->
    @request = options.request
