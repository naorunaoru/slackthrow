require 'lib/view_helper'

class Application extends Backbone.Marionette.Application
  initialize: =>

    @on "initialize:after", (options) =>
      Backbone.history.start
        pushState: true

    @addInitializer =>
      AppLayout = require 'views/AppLayout'
      @layout = new AppLayout()
      @layout.render()

    @addInitializer =>
      # Instantiate the router
      Router = require 'lib/router'
      @router = new Router()

    @addInitializer =>
      # global player
      GlobalPlayer = require 'views/GlobalPlayer'

      @vent.on 'player:load', (model, autoplay) =>
        console.log model, autoplay
        @layout.player.show new GlobalPlayer
          model: model
          autoplay: autoplay

    @start()



module.exports = new Application()
