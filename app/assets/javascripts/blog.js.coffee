
if $('html').hasClass('blog')
  
  $(document).on 'mouseenter', '.slidey-image', (event) ->
    console.log "mouseEnter"
    $(this).animate
      height:330
      opacity:1
    , 250
  
  $(document).on 'mouseleave', '.slidey-image', (event) ->
    console.log "mouseLeave"
    $(this).animate
      height:100
      opacity:0.6
    , 250