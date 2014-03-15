app = require 'application'

module.exports = class TrackView extends Marionette.ItemView
  template: require 'views/templates/trackView'

  events:
    'click a': 'triggerSelected'

  initialize: ->

    @model.on 'selected', =>
      @render()
      app.vent.trigger 'player:load', @model, true

    @model.on 'deselected', =>
      @render()

    @model.on 'playpause', =>
      @render()

  triggerSelected: (event) ->
    event.preventDefault()

    if @model.selected
      if !@model.paused
        app.vent.trigger 'player:pause'
        @$el.find('a').removeClass('playing').addClass('paused')
        @model.paused = true
      else
        app.vent.trigger 'player:play'
        @$el.find('a').removeClass('paused').addClass('playing')
        @model.paused = false
    else
      @model.collection.select(@model)

  onRender: ->
    if @model.selected
      if @model.paused
        @$el.find('a').removeClass('playing').addClass('paused')
        @model.paused = true
      else
        @$el.find('a').removeClass('paused').addClass('playing')
        @model.paused = false
