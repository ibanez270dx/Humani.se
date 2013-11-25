
if $('html').hasClass('main')

  # Scale the background to the document width
  scaleSite = ->
    $('[data-background]').each ->
      w = if $(document).width() < 1440 then 1440 else $(document).width()
      x = $(this).offset().left+(1440-$(document).width())/2
      y = $(this).offset().top
      $(this).css
        backgroundPosition: "-#{x}px -#{y}px"
        backgroundSize: "#{w}px"

  # Rescale the background as the window size changes
  $(window).resize ->
    scaleSite()

  $(document).ready ->
    scaleSite()

  window.onload = ->
    scaleSite()
