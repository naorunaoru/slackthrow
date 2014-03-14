module.exports = class Spinner extends Marionette.ItemView
  template: require 'views/templates/spinner'
  className: 'spinner'

  onRender: ->
    @$el.find('span').css('opacity', 0).animate({
      opacity: 1
      }, 200)
