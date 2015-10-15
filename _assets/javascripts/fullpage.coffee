fixiOSBackgroundPosition = ->
  iOS = /(iPad|iPhone|iPod)/g.test(navigator.userAgent)

  if iOS
    $('.sp-page').css('background-attachment', 'scroll')


setupFullpage = ->
  $('#fullpage .section').each ->
    $section = $(this).height($(window).height())
    pageHeight = $section.children('.sp-page').outerHeight()
    $section.height(Math.max(pageHeight, $(window).height()))


initFP = ->
  $(window).resize(setupFullpage).resize()
  fixiOSBackgroundPosition()


$ initFP
