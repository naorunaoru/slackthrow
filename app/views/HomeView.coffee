Track = require 'models/track'
TrackCollection = require 'collections/tracks'

module.exports = class HomeView extends Backbone.Marionette.ItemView
  id: 'home-view'
  template: 'views/templates/home'
