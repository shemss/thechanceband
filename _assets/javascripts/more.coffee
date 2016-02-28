initReadMore = ->
  $('.read-more a').click (e) ->
    e.preventDefault()
    $(this).find('.more-less').toggle()
    .closest('.read-more').prev('.more').toggleClass('visible')
    $(window).resize()


$ initReadMore
