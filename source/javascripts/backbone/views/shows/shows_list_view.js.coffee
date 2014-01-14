class Afisha.Views.ShowsListView extends Marionette.CollectionView
  tagName: 'ul'
  className: 'shows-list-block'
  itemView: Afisha.Views.ShowsListItemView
  
  getTemplate: ->
    #if @model.get('state') == 'open'
    JST["shows/shows_list"]

  onRender: ->
    @$el.html "<h3>It works</h3>"
  #appendHtml: (collectionView, itemView, index) ->
  #collectionView.$el.prepend itemView.el
