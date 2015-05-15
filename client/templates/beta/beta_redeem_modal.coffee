Template.betaRedeemModal.rendered = ->

  $('#beta-redeem-form').validate(
    rules:
      emailAddressSignup:
        required: true
        email: true
      password:
        required: true
        minlength: 6
      verify:
        required: true
        equalTo: '[name="password"]'
      betaToken:
        required: true
    messages:
      emailAddress:
        required: "Please enter your email address."
        email:    "Please enter a valid email address."
      password:
        required:  "Please enter a password."
        minlength: "Password length must be six characters."
      verify:
        required: "Please verify your password."
        equalTo:  "Passwords do not match"
      betaToken:
        required: "A valid beta token is required."
    submitHandler: ->
      # Grab the user's details.
      user =
        email: $('[name="emailAddressSignup"]').val().toLowerCase()
        password: $('[name="password"]').val()
        verify: $('[name=verify]').val()
        betaToken: $('[name="betaToken"]').val()

      # Make a call to validateBetaToken on the server. This will test that a
      # token exists for the email given. If it succeeds, the token is
      # invalidated/destroyed on the server and the account is created.
      Meteor.call 'validateBetaToken', user, (error)->
        if error
          sAlert.error error.reason
        else
          # In order to get our roles working, we needed to create our user
          # on the server. This is well and good, but this means that we don't
          # get the nice bonus of Meteor automatically logging in our new user.
          # To compensate, we can do this manually here. Note: we're making the
          # assumption that our user exists because we're calling this after
          # our user was created on the server. If for some reason they were
          # not created, this will fail. That failure would be rare, but keep
          # it in mind (e.g. if a server disconnected unexpectedly). Also note
          # that we're using the email/password combo passed above, but
          Meteor.loginWithPassword(user.email, user.password, (error)->
            if error
              alert error.reason
            else
              # Finally, we need to manually redirect our user to the
              # "dashboard" (our example beta tester view — not required)
              # after login.
              Router.go '/dashboard'
          )
  )

Template.betaRedeemModal.helpers(
  betaToken: ->
    Session.get 'betaToken'
)

Template.betaRedeemModal.events(
  'click #beta-redeem-submit' : (e) ->
    e.preventDefault()
    $('#beta-redeem-form').submit()
)
