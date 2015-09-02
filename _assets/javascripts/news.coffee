$ twitterFetcher.fetch
  id: '638873667997319169'
  domId: 'twitter-feed'
  maxTweets: 7
  customCallback: (tweets) ->
    $feed = $('#twitter-feed')
    $feed.html("<ul><li>#{tweets.join('</li><li>')}</li></ul>")
    $feed.find('.twitter_reply_icon').prepend('<i class="fa fa-reply"></i> ')
    $feed.find('.twitter_retweet_icon').prepend('<i class="fa fa-retweet"></i> ')
    $feed.find('.twitter_fav_icon').prepend('<i class="fa fa-star"></i> ')

    $(window).resize()
