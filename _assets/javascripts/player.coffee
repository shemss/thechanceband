playerIndex = 0
players = null
currentPlayer = null


toggleTrack = (e) ->
  e.preventDefault()
  player = $(this).siblings('.song-audio')[0]
  if player == currentPlayer
    toggleMusic(e)
  else
    currentPlayer.pause()
    currentPlayer = player
    playerIndex = players.index(player)
    currentPlayer.currentTime = 0
    currentPlayer.play()


toggleMusic = (e) ->
  e.preventDefault()
  if currentPlayer.paused
    currentPlayer.play()
  else
    currentPlayer.pause()


nextButton = (e) ->
  e.preventDefault()
  nextPlayer()


prevButton = (e) ->
  e.preventDefault()
  prevPlayer()


seekTrack = (e) ->
  e.preventDefault()
  offsetX = e.originalEvent.pageX - $(this).offset().left
  position = offsetX / $(this).outerWidth()
  seekTo = currentPlayer.duration * position
  currentPlayer.currentTime = seekTo


nextPlayer = ->
  currentPlayer.pause()
  currentPlayer = players[++playerIndex]
  currentPlayer ?= players[playerIndex = 0]
  currentPlayer.currentTime = 0
  currentPlayer.play()


prevPlayer = ->
  currentPlayer.pause()
  currentPlayer = players[--playerIndex]
  currentPlayer ?= players[playerIndex = players.length-1]
  currentPlayer.currentTime = 0
  currentPlayer.play()


initPlayer = (player, index) ->
  $(player)
  .on 'playing', ->
    playerIndex = index
    currentPlayer = player
    $('#music-toggle').addClass('playing')
    $(player).siblings('.song-toggle').addClass('playing')

  .on 'pause', ->
    $('#music-progress-bar').hide()
    $('#music-toggle').removeClass('playing')
    $(player).siblings('.song-toggle').removeClass('playing')

  .on 'timeupdate', ->
    position = (100 / player.duration) * player.currentTime
    $('#music-progress-bar').show()
    $('#music-progress').css
      width: "#{position}%"

  .on 'ended', (e) -> nextPlayer()


initPlayers = ->
  players = $('.song-audio')
  players.each (i) -> initPlayer this, i
  currentPlayer = players[playerIndex]

  $('.song-toggle').click toggleTrack
  $('#music-toggle').click toggleMusic
  $('#music-next').click nextButton
  $('#music-prev').click prevButton
  $('#music-progress-bar').on 'touchend touchleave click', seekTrack


$ initPlayers
