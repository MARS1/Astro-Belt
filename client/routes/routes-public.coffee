Router.route('home',
  path: '/'
  name: 'home'
  onBeforeAction: ->
    Session.set 'currentRoute','home'
    @next()
)

Router.route('signup',
  path: '/signup'
  name: 'signup'
  onBeforeAction: ->
    Session.set 'currentRoute', 'signup'
    Session.set 'betaToken', ''
    @next()
)

Router.route('signup/:token',
  path: '/signup/:token'
  name: 'signupToken'
  onBeforeAction: ->
    Session.set 'currentRoute','signup'
    Session.set 'betaToken', @params.token
    @next()
)
