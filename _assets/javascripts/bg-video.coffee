source = ($section, format) ->
  $('<source>')
  .attr('type', "video/#{format}")
  .attr('src', "/bgvids/#{$section.data('bgvid')}.#{format}")


initBgVideo = ->
  $('[data-bgvid]').each ->
    $section = $(this)
    $section.prepend(
      $('<video class="bgvid" muted>').on 'loadeddata', ->
        $section.addClass('video-loaded')
      .prop('loop', $section.data('loop'))
      .append(source($section, 'webm'))
      .append(source($section, 'mp4'))
    )

  $(window.location).on 'change', ->
    $section = $("##{location.href.split('#')[1]}")
    $prev = $section.prevAll('.section').get(0)
    $next = $section.nextAll('.section').get(0)
    $sections = $section.add($prev).add($next)
    $('.section').removeClass('video-top')
    $sections.addClass('video-top')

    $("##{location.href.split('#')[1]} .bgvid").each ->
      this.play() if this.paused

  $(window.location).trigger('change')


$ ->
  $(window).on 'autoplay-detected', initBgVideo
