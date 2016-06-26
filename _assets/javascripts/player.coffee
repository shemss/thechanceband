tracks = null
player = null


setTrack = (track) ->
  $track = $(track)
  $(player)
  .attr('src', $track.attr('href'))
  .data('track', $track.data('index'))


toggleTrack = (e) ->
  e.preventDefault()
  if $(this).data('index') == $(player).data('track')
    toggleMusic(e)
  else
    setTrack(this)
    player.play()


toggleMusic = (e) ->
  e.preventDefault()
  if player.paused
    player.play()
  else
    player.pause()


nextButton = (e) ->
  e.preventDefault()
  nextTrack()


prevButton = (e) ->
  e.preventDefault()
  prevTrack()


seekTrack = (e) ->
  e.preventDefault()
  offsetX = e.originalEvent.pageX - $(this).offset().left
  position = offsetX / $(this).outerWidth()
  seekTo = player.duration * position
  player.currentTime = seekTo


nextTrack = ->
  index = $(player).data('track')
  track = tracks[++index] || tracks[0]
  setTrack(track)
  player.play()


prevTrack = ->
  index = $(player).data('track')
  track = tracks[--index] || tracks[tracks.length - 1]
  setTrack(track)
  player.play()


setProgress = ->
  position = (100 / player.duration) * player.currentTime
  $('#music-progress, .song-progress').css
    width: "#{position}%"


initPlayer = ->
  player = document.createElement('audio')

  $(player).appendTo($('body'))

  .on 'playing', ->
    $('.song').removeClass('playing')
    setProgress()

    $('#music-toggle').addClass('playing')
    track = tracks[$(player).data('track')]
    $(track).closest('.song').addClass('playing')

  .on 'pause', ->
    $('#music-progress-bar').hide()
    $('#music-toggle, .song').removeClass('playing')

  .on 'timeupdate', ->
    setProgress()
    $('#music-progress-bar').show()

  .on 'ended', (e) -> nextTrack()

  tracks = $('.song-toggle')
  .each (i) -> $(this).data('index', i)

  setTrack(tracks[0])

  $('.song-toggle').click toggleTrack
  $('#music-toggle').click toggleMusic
  $('#music-next').click nextButton
  $('#music-prev').click prevButton
  $('#music-progress-bar').on 'touchend touchleave click', seekTrack


$ initPlayer
