initNews = ->
  twitterFetcher.fetch
    profile: { screenName: 'chancebandmusic' }
    domId: 'twitter-feed'
    maxTweets: 7
    customCallback: (tweets) ->
      $feed = $('#twitter-feed')
      $feed.html("<ul><li>#{tweets.join('</li><li>')}</li></ul>")
      $feed.find('.twitter_reply_icon')
      .html('<i class="fa fa-reply"></i> <span class="sr-only">Reply</span>')
      $feed.find('.twitter_retweet_icon')
      .html('<i class="fa fa-retweet"></i> <span class="sr-only">Retweet</span>')
      $feed.find('.twitter_fav_icon')
      .html('<i class="fa fa-star"></i> <span class="sr-only">Favorite</span>')
      $feed.find('.timePosted a').each ->
        $(this).text($(this).text().replace('Posted on ', ''))

      $(window).resize()
      loadAvatars()


loadAvatars = ->
  $('#twitter-feed [data-scribe="element:avatar"]').each ->
    $avatar = $(this)
    $avatar.data('src-1x', $avatar.attr('src')) unless $avatar.data('src-1x')
    if window.devicePixelRatio > 1
      $avatar.attr('src', $avatar.data('src-2x'))
    else
      $avatar.attr('src', $avatar.data('src-1x'))


listenToPixelRatio = ->
  return if !window.matchMedia or !window.matchMedia('').addListener
  window.matchMedia('(-webkit-device-pixel-ratio:1)').addListener(loadAvatars)
  window.matchMedia('(-moz-device-pixel-ratio:1)').addListener(loadAvatars)
  window.matchMedia('(-o-device-pixel-ratio:1)').addListener(loadAvatars)
  window.matchMedia('(resolution:1)').addListener(loadAvatars)


$ initNews
$ listenToPixelRatio
