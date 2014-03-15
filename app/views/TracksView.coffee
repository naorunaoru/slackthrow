TrackView = require 'views/TrackView'

module.exports = class TracksView extends Marionette.CompositeView
  template: require 'views/templates/searchResults'
  tagName: 'row'
  className: 'results-container'

  itemView: TrackView
  itemViewContainer: '.results'
