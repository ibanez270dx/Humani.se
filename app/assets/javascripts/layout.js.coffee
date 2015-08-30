
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

wrapTitles = ->
  $('[wrap="bt-rl"]').each (i, title) ->
    width = 0
    originalHeight = $(title).height()
    spacer = $('<div style="float:left;height:1px;" />').prependTo(title);
    while (originalHeight == $(title).height())
      spacer.width( ++width );
    spacer.width( --width );

###################################################################
# Init / Events
###################################################################

init = ->
  scaleSite()
  wrapTitles()

# Rescale the glass as the window size changes
$(window).resize -> init()

# Rescale the glass on turbolinks page load
$(document).on "ready page:load", -> init()
