
if $('html').hasClass('blog')

  # Float Social Buttons
  $(document).on 'scroll', ->
    doc_top = $(window).scrollTop()
    soc_top = $('.social-buttons').offset().top

    if doc_top > 485
      $('.social-buttons').css
        position: 'fixed',
        top: '10px'
    else
      $('.social-buttons').css
        position: 'relative',
        top: 'auto'