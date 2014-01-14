#@Afisha.module "Controller", (Entities, Controllers, App, Backbone, Marionette, $, _) ->

class Afisha.Models.Show extends Backbone.Model
  paramRoot: "show"

class Afisha.Collections.ShowsCollection extends Backbone.Collection
  model: Afisha.Models.Show
  #url: 'http://www.corsproxy.com/immense-shelf-2808.herokuapp.com/'
  url: './data/shows.json'

  initialize: ->
    @on 'sync', @build_collection

  build_collection: () ->
    objects = this.last().get('response')
    this.reset(objects)
