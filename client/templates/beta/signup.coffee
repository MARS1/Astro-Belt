Template.signup.onRendered( ->
  token = Session.get('betaToken')
  $('#beta-redeem-modal').modal('show')
  $('#redeem-token').val(token)
)
