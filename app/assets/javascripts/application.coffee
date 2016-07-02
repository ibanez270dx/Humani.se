#= require jquery
#= require jquery_ujs
#= require jquery.fontspy
#= require gist-embed
#= require turbolinks
#= require_tree .

# Add to_s to Array
if Array::to_s == undefined
  Array::to_s = -> this.join(' ')
