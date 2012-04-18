class Agenda2.Views.ContactItem extends Backbone.View

  template: JST['contacts/item']

  events: {
  	'mouseenter' : 'showDelete',
  	'mouseleave' : 'hideDelete',
  	'click .icon-delete' : 'deleteContact'
  }

  tagName: 'li'

  initialize: ->
  	@model.on('change', @render, this)

  render:->
  	$(@el).html(@template(contact : @model))
  	this

  showDelete: ->
  	@$('.icon-delete').show()

  hideDelete: ->
  	@$('.icon-delete').hide()

  deleteContact: ->
  	@model.destroy({
      wait: true
      success: -> 
        @notifications = new Agenda2.Models.Notification({ message : "<li>Contact deleted!</li>", className : "alert-info" })
        view = new Agenda2.Views.ContactNotification({model : @notifications})
        $("#detail").html('')
        $("#notifications").html(view.render().el)
    }) if confirm '¿Are you sure?'