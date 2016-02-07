navigateTo = ($section) ->
  sectionId = $section.attr('id')
  $section.attr('id', '')
  location.replace '#'+sectionId
  $section.attr('id', sectionId)

  $('.lang-links a').each ->
    $link = $(this)
    $link.attr('href',
      [$link.attr('href').split('#')[0], sectionId].join('#'))


scrollSpyEnd = ->
  $destination = null

  $('#fullpage .section').each ->
    $section = $(this)
    if $section.offset().top < ($(window).scrollTop() + 40)
      $destination = $section

  $("#site-navbar a[href='##{$destination.attr('id')}']")
  .parent().addClass('active')
  .siblings().removeClass('active')

  navigateTo($destination)


scrollTimout = null
scrollSpy = ->
  window.clearTimeout scrollTimout
  scrollTimout = window.setTimeout(scrollSpyEnd, 10)


initScroll = ->
  $('#site-navbar .navbar-center a, .navbar-brand').click (e) ->
    e.preventDefault()
    $(window).scrollTo($(this).attr('href'), 500)

  $(window).scroll(scrollSpy).scroll()


initNav = ->
  $('.navbar-affix').affix
    offset:
      top: -> $(window).height() - $('.navbar-affix').outerHeight()

  initScroll()


$ initNav


# Bootstrap navbar mods
$ ->
  navMain = $("#site-navbar")
  navMain.on 'click', 'a', null, ->
    navMain.collapse('hide')
