
window.setFilepickerImage = (url) ->
  $('#post_filepicker_url').val url
  $('#post-image').html("<img src=\"#{url}/convert?w=500\" />")
