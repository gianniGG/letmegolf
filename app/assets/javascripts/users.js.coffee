# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#change-password').hide()
  $('#change-profile-picture').hide()
  $('#change-affiliation').hide()

  editSettingsShow = (btn) ->
    $('.jumbotron.row').hide();
    $('#' + btn).show();

  $('.edit-user-nav a').on 'click', ->
    editSettingsShow $(this).data('id')

  #if user name exists already ?
  $('#user_name').on('keyup', ->
    $.get('/check_username', (username_check) ->

    )

  )


