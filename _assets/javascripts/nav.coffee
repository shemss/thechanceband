fixiOSBackgroundPosition = ->
  iOS = /(iPad|iPhone|iPod)/g.test(navigator.userAgent)

  if iOS
    $('.sp-page').css('background-attachment', 'scroll')


setupFullpage = ->
  $('#fullpage .section').each ->
    $section = $(this)
    pageHeight = $section.children('.sp-page').outerHeight()
    $section.height(Math.max(pageHeight, $(window).height()))


initNav = ->
  $('.navbar-affix').affix
    offset:
      top: -> $(window).height() - $('.navbar-affix').outerHeight()

  $(window).resize(setupFullpage).resize()
  fixiOSBackgroundPosition()


$ initNav
