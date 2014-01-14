#@Afisha.module "Controller", (Controllers, App, Backbone, Marionette, $, _) ->
class Afisha.Routers.AppRouter extends Backbone.Router

  initialize: () ->
    @shows = @fetchShows()
    #@movies = @fetchMovies()
    #@cinemas = @fetchCinemas()
    @generateIndexView(@shows)

  generateIndexView: (shows)->
    @index_view ||= new Afisha.Views.ShowsListView
    html = @index_view.render(shows).el
    $('@shows-list').html(html)

  fetchShows: () ->
    collection = new Afisha.Collections.ShowsCollection()
    collection.fetch({async: false})
    collection

  #fetchIndexObjects: () ->
  #  collection = new App.Collections.ObjectsCollection()
  #  collection.fetch({async: false})
  #  collection
