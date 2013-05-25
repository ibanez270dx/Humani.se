
if $('html').hasClass('blog')
  
  $(document).on 'mouseenter', '.slider-photo', (event) ->
    console.log "mouseEnter"
    $(this).animate
      height:450
    , 250
  
  $(document).on 'mouseleave', '.slider-photo', (event) ->
    console.log "mouseLeave"
    $(this).animate
      height:200
    , 250