# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('.prev a').live 'click', () ->
  $('#content').hide('slide', {direction: 'right'}, 100)

$('.next a').live 'click', () ->
  $('#content').hide('slide', {direction: 'left'}, 100)