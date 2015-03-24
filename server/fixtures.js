/* Default app data for getting things up and running */

/* Default user account*/
if ( Meteor.users.find().count() === 0 ) {
    Accounts.createUser({
        username: 'super',
        email: 'super@user.com',
        password: 'super',
        profile: {
          first_name: 'Super',
          last_name: 'User',
          company: 'Super Corp',
        },
        roles: [
        		'admin'
        ]
    });
}