
# Scale the background to the document width
scaleBackground = ->
  docWidth = $(document).width()
  $('header, article').each ->
    offset = $(this).offset()
    $(this).css
      backgroundPosition: "-#{offset.left}px -#{offset.top}px"
      backgroundSize: "#{docWidth}px"

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

###################################################################
# Init / Events
###################################################################

ready = ->
  scaleBackground()
  $('code[data-gist-id]').gist()
  if $("html").hasClass("seansotherhand")
    wrapTitles()
  else
    fontSpy 'Seans Other Hand',
      success: -> wrapTitles()

# Rescale the glass as the window size changes
$(window).resize -> ready()

# Run ready function on turbolinks:load
$(document).on "turbolinks:load", -> ready()

# Close the freelancing banner
$(document).on "click", "#freelancing .close", (event) ->
  $("html").removeClass "push-down"
  interval = setInterval(scaleBackground, 25)
  setTimeout ->
    clearInterval(interval)
  , 1000
