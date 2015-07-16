
# Scale the background to the document width
scaleSite = ->
  $('nav, article').each ->
    docWidth = $(document).width()
    offset = $(this).offset()
    position = "-#{offset.left}px -#{offset.top}px"
    size = "#{docWidth}px"

    $(this).css
      backgroundPosition: position
      backgroundSize: size

###################################################################
# Init / Events
###################################################################

# Rescale the glass as the window size changes
$(window).resize ->
  scaleSite()

# Rescale the glass on turbolinks page load
$(document).on "ready page:load", ->
  scaleSite()
