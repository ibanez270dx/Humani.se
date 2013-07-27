
if $('html').hasClass('application')

  #########################
  # Methods
  #########################

  scaleSite = ->
    console.log "scaling site..."

    # Grab site width
    width = $('.navbar').width()

    # Scale background and navbar
    $("body, .navbar-inner").css
      backgroundSize: "#{width}px"

    # Scale glass boxes articles
    $(".glass-box").each ->
      x = $(this).offset().left
      y = $(this).offset().top

      $(this).css
        backgroundPosition: "-#{x}px -#{y}px"
        backgroundSize: "#{width}px"

    # Scale the shadow on the photo for the main article page
    scaleShadow()

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
