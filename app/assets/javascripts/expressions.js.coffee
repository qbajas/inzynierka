# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$('img.imageSelect').live 'click', () ->
  for image in $('img.imageSelected')
    image.className = 'imageSelect'
  this.className= 'imageSelected'
  $('input#image_url[type=hidden]').attr('value', this.getAttribute('image_url') )
  $('#image_preview').html('<img src="' + this.getAttribute('image_url') + '" style="max-height:500px; max-width:500px;" />')


$('#definitions .definition').live 'click', () ->
  textarea = $('textarea#expression_definition')
  textarea.val( textarea.val() + this.innerHTML.replace("\n","") + "\n" )
  this.className = this.className + ' inactive'

$('#examples .example').live 'click', () ->
  textarea = $('textarea#expression_examples')
  textarea.val( textarea.val() + this.innerHTML.replace("\n","") + "\n" )
  this.className = this.className + ' inactive'

$('#synonyms .synonym').live 'click', () ->
  textarea = $('textarea#expression_synonyms')
  textarea.val( textarea.val() + this.innerHTML.replace("\n","") + "" )
  this.className = this.className + ' inactive'


$('#suggested_name .name').live 'click', () ->
  textarea = $('input#expression_name')[1]
  textarea.value = this.innerHTML
  this.className = this.className + ' inactive'

$('#load_data').live 'click', () ->
  $('#data_loading').show()
