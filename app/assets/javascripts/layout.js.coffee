
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
    $("article.glass-box").each ->
      xOffset = ($(window).width()-$(this).width()-30)/2
      console.log "xOffset: ", xOffset
      yOffset = $(this).offset().top
      console.log "yOffset: ", yOffset
      
      $(this).css
        backgroundPositionX: "-#{xOffset}px"
        backgroundPositionY: "-#{yOffset}px"
        backgroundSize: "#{width}px"
        backgroundRepeat: "no-repeat"
      
      console.log "offset applied: ", $(this).css('background-position-x')  

    # Scale glass box sidebars
    $("aside.glass-box").each ->
      xOffset = switch
        when width < 767 then 20
        when width < 960 then 0
        when width >= 960 then (width-960)*0.5
      yOffset = $(this).offset().top   
       
      $(this).css
        backgroundPositionX: "-#{xOffset}px"
        backgroundPositionY: "-#{yOffset}px"
        backgroundSize: "#{width}px"
        backgroundRepeat: "no-repeat"
    
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
                                    