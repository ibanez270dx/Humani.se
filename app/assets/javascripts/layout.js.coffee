
if $('html').hasClass('main')

  #########################
  # Methods
  #########################

  scaleSite = ->
    $('[data-background]').each ->
      $(this).css
        backgroundPosition: "-#{$(this).offset().left}px -#{$(this).offset().top}px"
        backgroundSize: "#{$(document).width()}px"

  scaleShadow = ->
    $('.photo-shadow').css
      width:  "#{$('img.article-photo').width()}px"
      height: "#{$('img.article-photo').height()+1}px"

  #########################
  # Event Listeners
  #########################

  # Rescale the background as the window size changes
  $(window).resize ->
    scaleSite()

  # Social Icons (MouseEnter)
  $(document).on 'mouseenter', 'ul.social-icons li', ->
    $(this).find('img:first').fadeTo 'fast', 0
    $(this).find('img:last').fadeTo 'fast', 0.8

  # Social Icons (MouseLeave)
  $(document).on 'mouseleave', 'ul.social-icons li', ->
    if $(this).find('img:last').is(":animated")
      $(this).find('img:last').stop()
      $(this).find('img:first').stop()

    $(this).find('img:first').fadeTo 'fast', 0.5
    $(this).find('img:last').fadeTo 'fast', 0

  #########################
  # Init
  #########################

  $(document).ready ->
    scaleSite()

    $('img.article-photo').load ->
      console.log "hit load"
      scaleShadow()
