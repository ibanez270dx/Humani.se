

$(document).on 'scroll', ->

  # Float Social Buttons
  if $('#social-buttons').length > 0
    top = $('aside article#related-posts').offset().top+parseInt($('#social-buttons').css('height'));

    if $(window).scrollTop() > top
      $('#social-buttons').css
        position: 'fixed',
        top: '10px'
    else
      $('#social-buttons').css
        position: 'relative',
        top: 'auto'
