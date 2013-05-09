
if $('html').hasClass('application')
  
  #########################
  # Methods
  #########################

  scaleSite = ->
    console.log "scaling site..."
    
    width = $('.navbar').width()
    console.log "width: ", width
  
    # Scale background and navbar 
    $("body, .navbar-inner").css 
      backgroundSize: "#{width}px"
    
    # Scale glass boxes articles
    $(".glass-box").each ->
      $(this).css
        backgroundPositionX: "-#{$(this).offset().left}px"
        backgroundPositionY: "-#{$(this).offset().top}px"
        backgroundSize: "#{width}px"
      
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
                                    