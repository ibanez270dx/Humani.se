
# Scale the background to the document width
scaleBackground = ->
  $('nav, article').each ->
    docWidth = $(document).width()
    offset = $(this).offset()
    position = "-#{offset.left}px -#{offset.top}px"
    size = "#{docWidth}px"
    $(this).css
      backgroundPosition: position
      backgroundSize: size

wrapTitles = ->
  # Make text flow from bottom right corner of container. Text wraps upwards by
  # pushing characters over to the next line until the height needs to change.
  if $(window).width() > 767
    $('[wrap="bt-rl"]').each ->
      [width, height] = [0, $(this).height()]
      spacer = $('<div style="float:left;height:1px;" />').prependTo(this)
      while (height == $(this).height())
        spacer.width( ++width )
      spacer.width( --width )

  # Make text flow from the bottom up, but keep centered. Works using pre-line
  # and inserting a newline character at the optimal location in the title.
  selector = if $(window).width() > 767 then '[wrap="bt"]' else '[wrap^="bt"]'
  $(selector).each ->
    if $(this).height() > 75
      upper = new Array()
      lower = $(this).text().replace(/(\r\n|\n|\r|\s+)/gm," ").split(' ')
      while upper.to_s().length < lower.to_s().length
        upper.push lower.shift()
      lower.unshift upper.pop()
      $(this).html "#{upper.to_s()}\n#{lower.to_s()}"

# Scale blog titles (show page)
scaleFonts = ->
  $('[scale-font]').each ->
    fontSize = $(this).parent().width() * $(this).attr('scale-font')
    fontSize = 48 if fontSize >= 48
    fontSize = 36 if fontSize <= 36
    $(this).css 'font-size': fontSize

###################################################################
# Init / Events
###################################################################

ready = ->
  scaleBackground()
  scaleFonts()
  wrapTitles()

# Rescale the glass as the window size changes
$(window).resize -> ready()

# Rescale the glass on turbolinks page load
$(document).on "page:change", ->
  fontSpy 'Seans Other Hand',
    success: -> ready()
