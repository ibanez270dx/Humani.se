
if $('html').hasClass('main')

  # Scale the background to the document width
  scaleSite = ->
    $('[data-background]').each ->
      $(this).css
        backgroundPosition: "-#{$(this).offset().left}px -#{$(this).offset().top}px"
        backgroundSize: "#{$(document).width()}px"

  # Rescale the background as the window size changes
  $(window).resize ->
    scaleSite()

  $(document).ready ->
    scaleSite()
