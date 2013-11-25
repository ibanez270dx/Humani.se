
if $('html').hasClass('blog')

  $(document).ready ->
    if $('#social-buttons').length > 0

      # Float Social Buttons
      $(document).on 'scroll', ->
        if $(window).scrollTop() > 627
          $('#social-buttons').css
            position: 'fixed',
            top: '10px'
        else
          $('#social-buttons').css
            position: 'relative',
            top: 'auto'