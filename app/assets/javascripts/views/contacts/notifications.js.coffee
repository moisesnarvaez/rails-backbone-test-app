class Agenda2.Views.ContactNotification extends Backbone.View

  template: JST['contacts/notifications']

  render:->
  	$(@el).html(@template(notification : @model))
  	this