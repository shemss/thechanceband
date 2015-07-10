playerIndex = 0
players = null
currentPlayer = null


toggleButton = (e) ->
  e.preventDefault()
  currentPlayer.toggle()


nextButton = (e) ->
  e.preventDefault()
  currentPlayer.getSounds (sounds) ->
    currentPlayer.getCurrentSoundIndex (soundIndex) ->
      if sounds.length == soundIndex+1
        nextPlayer()
      else
        nextTrack()


prevButton = (e) ->
  e.preventDefault()
  currentPlayer.getCurrentSoundIndex (soundIndex) ->
    if soundIndex
      prevTrack()
    else
      prevPlayer()


seekTrack = (e) ->
  e.preventDefault()
  position = e.originalEvent.layerX / $(this).outerWidth()
  currentPlayer.getDuration (duration) ->
    currentPlayer.seekTo duration * position


nextTrack = ->
  currentPlayer.pause()
  currentPlayer.next()
  currentPlayer.seekTo(0)
  currentPlayer.play()


prevTrack = ->
  currentPlayer.pause()
  currentPlayer.prev()
  currentPlayer.seekTo(0)
  currentPlayer.play()


nextPlayer = ->
  currentPlayer.pause()
  currentPlayer = players[++playerIndex]
  currentPlayer ?= players[playerIndex = 0]
  currentPlayer.skip(0)
  currentPlayer.seekTo(0)
  currentPlayer.play()


prevPlayer = ->
  currentPlayer.pause()
  currentPlayer = players[--playerIndex]
  currentPlayer ?= players[playerIndex = players.length-1]
  currentPlayer.getSounds (sounds) ->
    currentPlayer.skip(sounds.length-1)
    currentPlayer.seekTo(0)
    currentPlayer.play()


initPlayer = (iframe, index) ->
  player = SC.Widget iframe

  player.bind SC.Widget.Events.PLAY, ->
    playerIndex = index
    currentPlayer = player
    $('#music-toggle').addClass('playing')

  player.bind SC.Widget.Events.PAUSE, ->
    $('#music-progress-bar').hide()
    $('#music-toggle').removeClass('playing')

  player.bind SC.Widget.Events.PLAY_PROGRESS, (e) ->
    $('#music-progress-bar').show()
    $('#music-progress').css
      width: "#{e.relativePosition*100}%"

  player.bind SC.Widget.Events.FINISH, (e) ->
    currentPlayer.isPaused (paused) ->
      nextPlayer() if paused

  player


initPlayers = ->
  players = $('.music-player-track').map (i) -> initPlayer this, i
  currentPlayer = players[playerIndex]

  $('#music-toggle').click toggleButton
  $('#music-next').click nextButton
  $('#music-prev').click prevButton
  $('#music-progress-bar').on 'touchend touchleave click', seekTrack


$ initPlayers
