# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#inbox').hide()
  $('#sent').hide()

  showMessages = (btn) ->
    $('.jumbotron.row').hide()
    $('#' + btn).show()

  $('.messages-nav a').on 'click', ->
    showMessages $(this).data('id')
