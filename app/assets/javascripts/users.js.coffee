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
    editSettingsShow($(this).data('id'))

    #   $('#change-password').show()
    #   $('#change-profile-picture').hide()
    #   $('#change-affiliation').hide()

    # $('.change-profile-picture-btn').on 'click', ->
    #   $('#change-password').hide()
    #   $('#change-profile-picture').show()
    #   $('#change-affiliation').hide()

    # $('.change-affiliation-btn').on 'click', ->
    #   $('#change-password').hide()
    #   $('#change-profile-picture').hide()
    #   $('#change-affiliation').show()