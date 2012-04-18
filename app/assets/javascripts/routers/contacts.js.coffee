class Agenda2.Routers.Contacts extends Backbone.Router
	routes:
		'' 					: 'index'
		'contacts' 			: 'index'
		'contacts/new' 		: 'newContact'
		'contacts/:id/edit' : 'editContact'

	initialize: ->
		

	index: ->
		@collection = new Agenda2.Collections.Contacts()
		@collection.fetch()
		view = new Agenda2.Views.ContactsIndex(collection : @collection)
		$("#container").html(view.render().el);
		$("#detail").html('');
		$("#notifications").html('');

	newContact: ->
		@contact = new Agenda2.Models.Contact()
		@collection.push(@contact)
		view = new Agenda2.Views.ContactEdit(model : @contact)
		$("#notifications").html('');
		$("#detail").html(view.render().el);

	editContact: (id) ->
		@contact = @collection.get(id)
		view = new Agenda2.Views.ContactEdit(model : @contact)
		$("#notifications").html('');
		$("#detail").html(view.render().el);