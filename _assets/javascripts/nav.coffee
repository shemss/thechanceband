navigateTo = ($section) ->
  sectionId = $section.attr('id')
  $section.attr('id', '')
  location.replace '/#'+sectionId
  $section.attr('id', sectionId)


scrollSpyEnd = ->
  $destination = null

  $('#fullpage .section').each ->
    $section = $(this)
    if $section.offset().top < ($(window).scrollTop() + 40)
      $destination = $section

  $("#site-navbar a[href='/##{$destination.attr('id')}']")
  .parent().addClass('active')
  .siblings().removeClass('active')

  navigateTo($destination)


scrollTimout = null
scrollSpy = ->
  window.clearTimeout scrollTimout
  scrollTimout = window.setTimeout(scrollSpyEnd, 10)


initScroll = ->
  $('#site-navbar a').click (e) ->
    e.preventDefault()
    $(window).scrollTo($(this).attr('href').slice(1), 500)

  $(window).scroll(scrollSpy).scroll()


initNav = ->
  $('.navbar-affix').affix
    offset:
      top: -> $(window).height() - $('.navbar-affix').outerHeight()

  initScroll()


$ initNav
