Router.route('dashboard',
  path: '/dashboard'
  name: 'dashboard'
  onBeforeAction: ->
    Session.set 'currentRoute', 'dashboard'
    @next()
)

Router.route('invites',
  path: '/invites'
  name: 'invites'
  waitOn: ->
    Meteor.subscribe '/invites'
  onBeforeAction: ->
    Session.set 'currentRoute', 'invites'
    @next()
)
