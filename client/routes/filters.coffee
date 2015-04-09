checkUserLoggedIn = ->
  if not Meteor.loggingIn() and not Meteor.user()
    Router.go '/'
  else
    @next()

userAuthenticatedBetaTester = ->
  loggedInUser = Meteor.user()
  isBetaTester = Roles.userIsInRole(loggedInUser, ['tester'])
  if not Meteor.loggingIn() and isBetaTester
    Router.go '/dashboard'
  else
    @next()

userAuthenticatedAdmin = ->
  loggedInUser = Meteor.user()
  isAdmin      = Roles.userIsInRole(loggedInUser, ['admin'])
  if not Meteor.loggingIn() and isAdmin
    Router.go '/invites'
  else
    @next()

Router.onBeforeAction checkUserLoggedIn, except: [
  'home'
  'signup'
  'signup/:token'
  'login'
  'recover-password'
  'reset-password'
]

Router.onBeforeAction userAuthenticatedBetaTester, only: [
  'home'
  'signup'
  'signup/:token'
  'login'
  'recover-password'
  'reset-password'
  'invites'
]

Router.onBeforeAction userAuthenticatedAdmin, only: [
  'home'
  'signup'
  'signup/:token'
  'login'
  'recover-password'
  'reset-password'
]
