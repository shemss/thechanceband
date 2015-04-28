initNav = ->
  $('.navbar-affix').affix
    offset:
      top: -> $(window).height() - $('.navbar-affix').outerHeight()

  $('.sp-page').each (i) ->
    $(this).affix
      offset:
        top: -> $(window).height() * i

  $('#fullpage').fullpage
    scrollBar: true
    touchSensitivity: 15
    anchors: ['home', 'music', 'media', 'story', 'connect']
    menu: '#site-navbar'


$ initNav
