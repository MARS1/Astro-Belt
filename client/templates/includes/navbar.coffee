Template.navbar.helpers
  activeMenu: ->
    activeClass = 'active'
    activeSpan = '<span class="sr-only">(current)</span>'
    args = Array.prototype.slice.call arguments,0
    args.pop()

    console.log args
    active = _.any args, (name) ->
      Router.current() && Router.current().route.getName() == name

    console.log active

    if active
      { activeClass: activeClass, activeSpan: activeSpan }
    else
      {}
