initNews = ->
  twitterFetcher.fetch
    id: '638873667997319169'
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


$ initNews
