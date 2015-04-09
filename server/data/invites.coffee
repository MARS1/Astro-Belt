Meteor.methods(

  addToInvitesList: (invitee) ->
    check(invitee, {email: String, requested: Number, invited: Boolean})

    emailExists = Invites.findOne({"email": newInvitee})

    if emailExists
      throw new Meteor.Error "email-exists", "It looks like you've already signed up for our beta. Thanks!"
    else
      inviteCount = Invites.find({},{fields: {"_id": 1}}).count()
      invitee.inviteNumber = inviteCount + 1

      Invites.insert(invitee, (error)->
        console.log error if error
      )

  countInvites: ->
    Invites.find({}, {fields: {"_id": 1}}).count()

  sendInvite: (invitee,url) ->
    # Check the invitee and url arguments against our expected patterns.
    check(invitee,{id: String, email: String})
    check(url,String)

    # Generate a token here so we can use it with our email, too.
    token = Random.hexString(10)

    # Update our user.
    Invites.update(invitee.id,
      $set:
        token: token
        dateInvited: ( new Date() ).getTime()
        invited: true
        accountCreated: false
    ,(error)->
      if error
        console.log error
      else
        # If no errors, send the user an email with their invitation.
        Email.send(
          to: invitee.email
          from: "AstroBelt <invites@astrobelt.com>"
          subject: "Welcome to AstroBelt!"
          html: Handlebars.templates['send-invite'](
            token: token
            url: url
            urlWithToken: url + "/#{token}"
          )
        )
    )
)
