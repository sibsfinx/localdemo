class Afisha.Views.ShowsListItemView extends Marionette.ItemView
  tagName: 'li'
  className: 'shows-list-item'
  templateHelpers: ->
    _.extend @templateHelpers
    #, ICRM.Helpers.ApplicationHelpers

  events:
    'click' : '_click'

  modelEvents:
    'change' : 'render'

  onRender: ->
    #if @model.get('_active') then @$el.addClass 'selected'
    #else @$el.removeClass 'selected'

  getTemplate: ->
    #if @model.get('state') == 'open'
    JST["shows/show_list_item"]

  _click: ->
    alert('movie click')
