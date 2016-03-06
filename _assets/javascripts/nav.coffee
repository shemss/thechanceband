navigateTo = ($section) ->
  prevSectionId = location.href.split('#')[1]
  sectionId = $section.attr('id')
  return if prevSectionId == sectionId

  $section.attr('id', '')
  location.replace '#'+sectionId
  $section.attr('id', sectionId)

  $('.lang-links a').each ->
    $link = $(this)
    $link.attr('href',
      [$link.attr('href').split('#')[0], sectionId].join('#'))


scrollSpyEnd = ->
  $destination = null

  $('#fullpage .section[id]').each ->
    $section = $(this)
    if $section.offset().top < ($(window).scrollTop() + 40)
      $destination = $section

  $("#site-navbar a[href='##{$destination.data('target') || $destination.attr('id')}']")
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

  $('.lang-links a').click (e) ->
    e.preventDefault()
    location.replace $(this).attr('href')

  initScroll()


$ initNav


# Bootstrap navbar mods
$ ->
  navMain = $("#site-navbar")
  navMain.on 'click', 'a', null, ->
    navMain.collapse('hide')
