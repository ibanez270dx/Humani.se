
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
  # Make text flow from bottom right corner of container. Text wraps upwards by
  # pushing characters over to the next line until the height needs to change.
  $('[wrap="bt-rl"]').each ->
    [width, height] = [0, $(this).height()]
    spacer = $('<div style="float:left;height:1px;" />').prependTo(this);

    while (height == $(this).height())
      spacer.width( ++width )
    spacer.width( --width )

  # Make text flow from the bottom up, but keep centered. Works using pre-line
  # by inserting a newline at the optimal location in the title.
  $('[wrap="bt"]').each ->
    if $(this).height() > 75
      title = $(this).text().replace(/(\r\n|\n|\r)/gm,"").replace(/\s+/gm," ")
      [words, upper, lower] = [title.split(' '), [], title.split(' ')]

      while (upper.strLength() < lower.strLength())
        upper.push(words.shift())
        lower = words

      lower.unshift(upper.pop())
      $(this).html("#{upper.join(' ')}\n#{lower.join(' ')}")

###################################################################
# Init / Events
###################################################################

ready = ->
  scaleSite()
  wrapTitles()

# Rescale the glass as the window size changes
$(window).resize -> ready()

# Rescale the glass on turbolinks page load
$(document).on "page:change", ->
  fontSpy 'Seans Other Hand',
    success: -> ready()
