
# Scale the background to the document width
scaleSite = ->
  $('nav, article').each ->
    docWidth = $(document).width()
    offset = $(this).offset()
    position = ""
    size = ""

    # if docWidth > 1440
    position = "-#{offset.left}px -#{offset.top}px"
    size = "#{docWidth}px"
    # else
    #   breakpoint = switch
    #     when docWidth > 800 then 1440
    #     when docWidth > 500 then 800
    #     else 500
    #   position = "-#{((breakpoint-docWidth)/2)+offset.left}px -#{offset.top}px"
    #   size = "#{breakpoint}px"

    console.log "position: ", position
    console.log "size: ", size

    $(this).css
      backgroundPosition: position
      backgroundSize: size

###################################################################
# Init
###################################################################

# Rescale the glass as the window size changes
$(window).resize ->
  scaleSite()

# Rescale the glass on turbolinks page load
$(document).on "ready page:load", ->
  scaleSite()
