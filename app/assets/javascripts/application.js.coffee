#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require_tree .

window.delayedFadeOut = (elements, delay = 3000) ->
  fadeAndRemove = -> elements.fadeOut 'slow', -> $(this).remove()
  setTimeout fadeAndRemove, delay
