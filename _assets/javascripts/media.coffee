initMedia = ->
  $('.row-gallery').scroll ->
    $row = $(this)
    $cont = $row.parent('.cont-gallery')

    if $row.scrollLeft() <= 0
      $cont.removeClass('left-scroll')
    else
      $cont.addClass('left-scroll')

    if $row.scrollLeft() + $row.innerWidth() >= this.scrollWidth
      $cont.removeClass('right-scroll')
    else
      $cont.addClass('right-scroll')

  .scroll()


initScrollBack = ->
  $('.scroll-back').click (e) ->
    e.preventDefault()
    $($(this).attr('href')).scrollTo(0, 500)


$ initMedia
$ initScrollBack
