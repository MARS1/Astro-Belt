# Default app data for getting things up and running

# Default user accounts
if Meteor.users.find().count() is 0
  users = [
        {name:"Super User",email:"super@user.com",roles:['admin']}
        {name:"Basic User",email:"basic@user.com",roles:[]}
      ]

  _.each(users, (user) ->
    # Save the new user id
    id = Accounts.createUser(
      email: user.email,
      password: "fake",
      profile:  name: user.name
    )

    # Assign roles to new user
    if user.roles.length > 0
      Roles.addUsersToRoles(id, user.roles);
  )
