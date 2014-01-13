
if $('html').hasClass('blog')

  $(document).ready ->
    if $('#social-buttons').length > 0
      
      # Float Social Buttons
      $(document).on 'scroll', ->
        top = $('aside article#related-posts').offset().top+parseInt($('#social-buttons').css('height'));
        
        if $(window).scrollTop() > top 
          $('#social-buttons').css
            position: 'fixed',
            top: '10px'
        else
          $('#social-buttons').css
            position: 'relative',
            top: 'auto'