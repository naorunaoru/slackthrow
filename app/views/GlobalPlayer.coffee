app = require 'application'

module.exports = class GlobalPlayer extends Marionette.ItemView
  template: require 'views/templates/globalPlayer'

  initialize: (options) ->
    @autoplay = options.autoplay

  events:
    'click control': 'playPause'

  playPause: ->
    if @playing
      app.vent.trigger 'player:pause'
      @model.paused = true
      @model.trigger 'playpause'
    else
      app.vent.trigger 'player:play'
      @model.paused = false
      @model.trigger 'playpause'

  onFinish: ->
    console.log 'finished playing'
    if @model.collection.length != @model.collection.indexOf(@model)+1
      @model.collection.at(@model.collection.indexOf(@model)+1).select()
    else
      @model.collection.deselect(@model)
      app.vent.trigger 'player:unload'

  onRender: ->
    @track = soundManager.createSound
      url: @model.get('file')
      onfinish: => @onFinish()

    if @autoplay
      @track.play()

      @playing = true

    app.vent.on 'player:play', =>
      @$el.find('control').attr('class', '')
      @playing = true
      @track.play()

    app.vent.on 'player:pause', =>
      @$el.find('control').attr('class', 'paused')
      @playing = false
      @track.pause()

    app.vent.on 'player:unload', =>
      @close()

  onClose: ->
    @track.destruct()
