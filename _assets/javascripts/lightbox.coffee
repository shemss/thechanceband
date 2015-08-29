initLightBox = ->
  $('.lightbox').fancybox
    openEffect  : 'elastic'
    closeEffect : 'elastic'


initVideoPreview = ->
  $('.video-preview').fancybox
    openEffect  : 'elastic'
    closeEffect : 'elastic'
    helpers :
      media : {}


$ initLightBox
$ initVideoPreview
