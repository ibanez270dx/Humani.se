
if $('html').hasClass('main')

  # Scale the background to the document width
  scaleSite = ->
    $('[data-background]').each ->
      if $(document).width() < 1440
        w = 1440 
        x = ($(this).offset().left+(1440-$(document).width())/2)
      else
        w = $(document).width()
        x = $(this).offset().left
 
      $(this).css
        backgroundPosition: "-#{x}px -#{$(this).offset().top}px"
        backgroundSize: "#{w}px"

  # Rescale the background as the window size changes
  $(window).resize ->
    scaleSite()

  window.onload = ->
    scaleSite()
