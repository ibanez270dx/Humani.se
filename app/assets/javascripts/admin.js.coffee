
if $('html').hasClass('admin')

  $(document).ready ->
    
    # Filepicker
    filepicker.setKey "AmJqL5MJUSbuPOJA7JD2Iz"

    $(document).on 'click', 'a#filepicker_url', (event) ->
      filepicker.pick
        mimetypes: "image/*"
      , ((FPFile) ->
        console.log JSON.stringify(FPFile)
        $('#post_filepicker_url').val(FPFile['url'])
        $('.post-image').html("<img src=\"#{FPFile['url']}/convert?w=160&h=160&fit=clip\" class=\"img-polaroid\" />")
      ), (FPError) ->
        console.log FPError.toString()
    
    # Automatically dismiss flash messages after 5 seconds
    setTimeout ->
      $('a[data-dismiss=alert]').click() 
    , 5000                      