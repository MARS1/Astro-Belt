Template.betaButtons.rendered = ->
  $('#beta-request-form').validate(
    rules:
      emailAddress:
        email : true
        required : true
    messages :
      emailAddress :
        email : "Please use a valid email address."
        required : "An email address is required to get your invite."
    submitHandler : ->
      invitee =
        email : $('[name="emailAddress"]').val().toLowerCase()
        invited : false
        requested : ( new Date() ).getTime()

      Meteor.call('validateEmailAddress', invitee.email, (error,response)->
      if error
        console.log error.reason
      else
        if response.error
          console.log response.error
        else
          Meteor.call 'addToInvitesList', invitee, (error,response) ->
            if error
              console.log error.reason
            else
              console.log "Invite requested!"
      )
  )

Template.betaButtons.events(
  'submit form' : (e) ->
    e.preventDefault()
    console.log "Hmmm"
)
