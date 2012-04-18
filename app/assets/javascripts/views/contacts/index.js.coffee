class Agenda2.Views.ContactsIndex extends Backbone.View

  template: JST['contacts/index']

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendContact, this)
    @collection.on('remove', @render, this)

  render:->
  	$(@el).html(@template())
  	@collection.each(@appendContact)
  	this

  appendContact: (contact) ->
  	view = new Agenda2.Views.ContactItem(model : contact)
  	$("#contact_list").append(view.render().el)
