AppData =
  name : 'Astro-Belt'
  author :
    name : '@jesseflorig'
    url  : 'http://jesseflorig.com'
  social : [
    icon : 'facebook'
    url  : 'http://www.facebook.com'
  ,
    icon : 'google-plus'
    url  : 'http://plus.google.com'
  ,
    icon : 'twitter'
    url  : 'http://www.twitter.com'
  ,
    icon : 'instagram'
    url  : 'http://www.instagram.com'
  ]
  liscence :
    name : 'MIT'
    url  : 'http://opensource.org/licenses/mit-license.html'
  source :
    name : 'GitHub'
    url  : 'https://github.com/jesseflorig/Astro-Belt'


Template.registerHelper 'AppData', ->
  AppData
