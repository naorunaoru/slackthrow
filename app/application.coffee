require 'lib/view_helper'
G = require 'globals'

class Application extends Backbone.Marionette.Application
  initialize: =>

    @on "initialize:after", (options) =>
      Backbone.history.start();
      # Freeze the object
      Object.freeze? this

    @addInitializer =>
      AppLayout = require 'views/AppLayout'
      @layout = new AppLayout()
      @layout.render()

    @addInitializer =>
      # Instantiate the router
      Router = require 'lib/router'
      @router = new Router()

    @start()



module.exports = new Application()
