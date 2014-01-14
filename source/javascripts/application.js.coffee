#= require jquery/jquery
#= require lib/jquery.role.min
#= require underscore/underscore
#= require backbone/backbone
#= require backbone.marionette/lib/backbone.marionette
#= require hamlcoffee
#= require backbone/app
#= require_tree ./backbone/routes
#= require_tree ./backbone/controllers
#= require_tree ./backbone/models
#= require_tree ./backbone/views


$ ->
  console.log 'it works'
