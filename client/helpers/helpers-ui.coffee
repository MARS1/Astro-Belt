UI.registerHelper('epochToString', (timestamp) ->
  moment.unix(timestamp / 1000).format("MMMM Do, YYYY")
)

UI.registerHelper('currentYear', ->
  moment.unix(Date.now() / 1000).format("YYYY")
)
