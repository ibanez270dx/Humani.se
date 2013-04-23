
#########################
# Methods
#########################

scaleSite = ->
  width = undefined
  console.log "scaling site..."
  width = $(window).width()
  $("body, nav").css "background-size", "" + width + "px"
  $("article.glass-box").each ->
    offset = undefined
    offset = $(this).offset().top
    $(this).css "background-position-y", "-" + offset + "px"
    $(this).css "background-size", "" + width + "px"
    $(this).css "background-repeat", "no-repeat"

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
