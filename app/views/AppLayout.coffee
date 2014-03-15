application = require 'application'

module.exports = class AppLayout extends Backbone.Marionette.Layout
  template: 'views/templates/appLayout'
  el: ".main-container"

  regions:
    search: "#search"
    content: "#content"
    player: "#player"
