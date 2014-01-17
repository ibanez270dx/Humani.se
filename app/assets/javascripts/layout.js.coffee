
if $('html').hasClass('main')



  # Scale the background to the document width
  scaleSite = ->
    $('[data-background]').each ->
      width  = $(document).width()
      offset = $(this).offset()

      if width > 1440
        position = "-#{offset.left}px -#{offset.top}px"
        size = "#{width}px"
      else 
        breakpoint = switch
          when width > 800 then 1440
          when width > 500 then 800
          else 500
        position = "-#{((breakpoint-width)/2)+offset.left}px -#{offset.top}px"
        size = "#{breakpoint}px"

      $(this).css
        backgroundPosition: position
        backgroundSize: size

  # Rescale the background as the window size changes
  $(window).resize ->
    scaleSite()

  window.onload = ->
    scaleSite() 

