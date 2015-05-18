Router.route 'dashboard',
  path: '/dashboard'
  name: 'dashboard'
  onBeforeAction: ->
    Session.set 'currentRoute', 'dashboard'
    @next()

Router.route 'samplePage',
  path: '/samplePage'
  name: 'samplePage'
  onBeforeAction: ->
    Session.set 'currentRoute', 'samplePage'
    @next()

Router.route 'invites',
  path: '/invites'
  name: 'invites'
  waitOn: ->
    Meteor.subscribe '/invites'
  onBeforeAction: ->
    Session.set 'currentRoute', 'invites'
    @next()
