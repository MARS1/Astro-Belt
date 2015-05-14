Template.betaRequestModal.rendered = ->
  $('#beta-request-form').validate(
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
        requestButton = $('.beta-btn-request')

        if error
          # console.log error.reason
          requestButton
            .html(error.reason)
            .toggleClass('btn-primary btn-danger')
            .attr('disabled','disabled')
        else
          # console.log 'Invite requested!'
          requestButton
            .html('Invite requested!')
            .toggleClass('btn-primary btn-success')
            .attr('disabled','disabled')

        $('#beta-request-modal').modal('hide')

      # Meteor.call('validateEmailAddress', invitee.email, (error,response)->
      # if error
      #   console.log error.reason
      # else
      #   if response.error
      #     console.log response.error
      #   else
      #     Meteor.call 'addToInvitesList', invitee, (error,response) ->
      #       if error
      #         console.log error.reason
      #       else
      #         console.log "Invite requested!"
      # )
  )

Template.betaRequestModal.events(
  'click #beta-request-submit' : (e) ->
    e.preventDefault()
    $('#beta-request-form').submit();
)
