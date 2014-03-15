Model = require 'models/model'

module.exports = class Track extends Model
  initialize: ->
    selectable = new Backbone.Picky.Selectable this
    _.extend this, selectable
