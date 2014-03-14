# Base class for all models.
module.exports = class Model extends Backbone.Model
  log: (arg) ->
    console.log @logPrefix + ':', arg
