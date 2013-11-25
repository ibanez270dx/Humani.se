
if $('html').hasClass('blog')

  $(document).ready ->
    if $('#social-buttons').length > 0
      originalOffset = $('#social-buttons').offset().top

      # Float Social Buttons
      $(document).on 'scroll', ->
        if $(window).scrollTop() > originalOffset+125
          $('#social-buttons').css
            position: 'fixed',
            top: '10px'
        else
          $('#social-buttons').css
            position: 'relative',
            top: 'auto'