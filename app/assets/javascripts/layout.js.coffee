
if $('html').hasClass('main')

  # Scale the background to the document width
  scaleSite = ->
    $('[data-background]').each ->
      y = $(this).offset().top
      if $(document).width() < 1440
        w = 1440 
        x = $(this).offset().left+(1440-$(document).width())/2
      else
        w = $(document).width()
        x = $(this).offset().left-(1440-$(document).width())/2 

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
