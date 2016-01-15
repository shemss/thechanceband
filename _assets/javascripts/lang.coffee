setLangCookie = ->
  $.cookie 'locale', $('html').attr('lang'),
    expires: 200000
    domain: window.siteDomain
    path: '/'


$ setLangCookie
