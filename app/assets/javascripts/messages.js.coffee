# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#sent, #new-message-form:not(.shown)').hide()
  $('.message-body').hide()


  showMessages = (btn) ->
    $('.jumbotron.row').hide()
    $('#' + btn).show()

  $('.messages-nav a').on 'click', ->
    showMessages $(this).data('id')

  #render the new message page in users#index
  $('#new-message').on 'click', ->
    event.preventDefault() #stops rails looking for view messages#new
    $('#new-message-form').show()

  #when clicking a subject of a message, show body of message
  $('.jumbotron > ul > a').click ->
    $(this).next().nextAll('div').eq(0).fadeIn()