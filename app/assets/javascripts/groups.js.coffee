# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#if group name exists already ?
$ ->
  #NEW GROUP PAGE
  #CREATING GROUPS VALIDATIONS

  $('#group_admins').val('')

  $('#groupname_check').hide()

  $('#group_name').on('keyup', ->

    $('#groupname_check').show()
    $.post('/groups/check_groupname', { name: $(this).val() }, (groupname) ->
      if groupname.free
        $('#groupname_check').text( $('#group_name').val() + " is free")
      else
        $('#groupname_check').text( $('#group_name').val() + " is taken, pick another name")
    )

    if $('#group_name').val() == ''
      $('#groupname_check').hide()

  )

  #EDIT GROUP PAGE
  $('#group-add-members, #group-remove-members, #group-compete').hide()

  showClickedForm = (btn) ->
    $('.jumbos-on-toggle').hide()
    $('#' + btn).show()

  $('button').on 'click', ->
    showClickedForm $(this).data('id')