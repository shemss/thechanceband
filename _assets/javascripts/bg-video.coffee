initBgVideo = ->
  $(window).on 'locationChange', ->
    $section = $("##{location.href.split('#')[1]}")
    $prev = $section.prevAll('.section').get(0)
    $next = $section.nextAll('.section').get(0)
    $sections = $section.add($prev).add($next)
    $('.section').removeClass('video-top')
    $sections.addClass('video-top')

    $("##{location.href.split('#')[1]} .bgvid").each ->
      this.play() if this.paused

  $(window).trigger('locationChange')


$(initBgVideo)
