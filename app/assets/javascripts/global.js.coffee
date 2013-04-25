
#########################
# Methods
#########################

scaleSite = ->
  console.log "scaling site..."
  width = $(window).width()
  
  # Scale background and navbar 
  $("body, nav").css 
    backgroundSize: "#{width}px"
    
  # Scale glass boxes articles
  $("article.glass-box").each ->
    xOffset = 925-$(this).width()
    yOffset = $(this).offset().top
       
    $(this).css
      backgroundPositionX: "-#{xOffset}px"
      backgroundPositionY: "-#{yOffset}px"
      backgroundSize: "#{width}px"
      backgroundRepeat: "no-repeat"

  # Scale glass box sidebars
  $("aside.glass-box").each ->
    xOffset = 980
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
  