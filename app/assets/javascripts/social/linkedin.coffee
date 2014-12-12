###################################################################
# Load LinkedIn SDK for plugins w/ Turbolinks
# http://reed.github.io/turbolinks-compatibility/linkedin.html
###################################################################

$ ->
  loadLinkedIn()
  $(document).on 'page:load', loadLinkedIn

loadLinkedIn = ->
  delete IN
  $.getScript("//platform.linkedin.com/in.js")
  lang: 'en_US'
