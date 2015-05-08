setupFullpage = ->
  $('#fullpage .section').each ->
    $section = $(this)
    pageHeight = $section.children('.sp-page').outerHeight()
    $section.height(Math.max(pageHeight, $(window).height()))


initNav = ->
  $('.navbar-affix').affix
    offset:
      top: -> $(window).height() - $('.navbar-affix').outerHeight()

  setupFullpage()
  $(window).resize setupFullpage

  $('.sp-page').each (i) ->
    $page = $(this)
    $page.affix
      offset:
        top: -> $page.parent().offset().top +
          $page.outerHeight() - $(window).height()


$ initNav
