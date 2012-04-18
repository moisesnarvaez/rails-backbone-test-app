window.Agenda2 =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
  	new Agenda2.Routers.Contacts()
  	Backbone.history.start()

$(document).ready ->
  Agenda2.init()
