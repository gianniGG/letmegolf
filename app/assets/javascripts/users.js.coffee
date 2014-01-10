# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#change-password').hide()
  $('#change-profile-picture').hide()
  $('#change-affiliation').hide()

  #for username check
  $('#username_check').hide()

  editSettingsShow = (btn) ->
    $('.jumbotron.row').hide();
    $('#' + btn).show();

  $('.edit-user-nav a').on 'click', ->
    editSettingsShow $(this).data('id')

  #if user name exists already ?
  $('#user_name').on('keyup', ->

    $('#username_check').show()
    $.post('/users/check_username', { username: $(this).val() }, (username) ->
      if username.free
        $('#username_check').text( $('#user_name').val() + " is free")
      else
        $('#username_check').text( $('#user_name').val() + " is taken, pick another name")
    )

    if $('#user_name').val() == ''
      $('#username_check').hide()

  )


