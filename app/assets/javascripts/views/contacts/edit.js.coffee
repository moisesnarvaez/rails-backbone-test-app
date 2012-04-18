class Agenda2.Views.ContactEdit extends Backbone.View

    template: JST['contacts/edit']

    events:
    	'submit #contact_form' : 'saveContact'
    	'click #cancel'        : 'cancelContact'

    render: ->
    	$(@el).html(@template(contact : @model))
    	this

    cancelContact: (event) ->
    	Backbone.history.navigate('', true)

    saveContact: (event) ->
        event.preventDefault()
        $("#notifications").html('')
        attributes = {
          name      : $('#name').val(),
          lastname  : $('#lastname').val(),
          cellphone : $('#cellphone').val(),
          email     : $('#email').val()
        }
        refresh = @model.isNew()
        @model.save(attributes, {
            wait: true
            success: -> 
                Backbone.history.navigate('', true) if refresh
                @notifications = new Agenda2.Models.Notification({ message : "<li>Contact saved</li>", className : "alert-success" })
                view = new Agenda2.Views.ContactNotification({model : @notifications})
                $("#notifications").append(view.render().el)
                
            error: @handleError
        })

    handleError: (contact, response) ->
        if response.status==422
            errors = $.parseJSON(response.responseText)
            msj = ''
            for attribute, messages of errors
                msj += "<li>#{attribute} #{message}</li>"  for message in messages
            @notifications = new Agenda2.Models.Notification({ message : msj, className : "alert-error" })
            view = new Agenda2.Views.ContactNotification({model : @notifications})
            $("#notifications").append(view.render().el)