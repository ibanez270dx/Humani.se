
window.setFilepickerImage = (url) ->
  console.log "setFilepickerImage: ", url
  $('#post_filepicker_url').val url
  $('#post-image').html("<img src=\"#{url}/convert?w=500\" />")


if $('html').hasClass('admin')

  $(document).ready ->

    # Filepicker
    filepicker.setKey "AmJqL5MJUSbuPOJA7JD2Iz"

    $(document).on 'click', '#filepicker_url', (event) ->
      filepicker.pick
        mimetype: "image/*"
      , ((FPFile) ->
        console.log "on success for filepicker.pick"
        console.log JSON.stringify(FPFile)
        $('#post_filepicker_url').val(FPFile['url'])
        $('#post-image').html("<img src=\"#{FPFile['url']}/convert?w=500\" />")
      ), (FPError) ->
        console.log "on error for filepicker pick"
        console.log FPError.toString()
