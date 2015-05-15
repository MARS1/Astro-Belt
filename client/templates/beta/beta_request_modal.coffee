Template.betaRequestModal.rendered = ->
  $('#beta-request-form').validate
    rules:
      emailAddress:
        email : true
        required : true
    messages :
      emailAddress :
        email : 'Please use a valid email address.'
        required : 'An email address is required to get your invite.'
    submitHandler : ->
      invitee =
        email : $('#request-email').val().toLowerCase()
        invited : false
        requested : ( new Date() ).getTime()

      Meteor.call 'addToInvitesList', invitee, (error, response) ->
        if error
          sAlert.error error.reason
        else
          sAlert.success 'Invite requested for '+invitee.email+'!'

        $('#beta-request-modal').modal 'hide'

Template.betaRequestModal.events
  'click #beta-request-submit' : (e) ->
    e.preventDefault()
    $('#beta-request-form').submit()
