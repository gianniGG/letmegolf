$ ->
  $('.home-thumb').hide();
  $('#signup-replacement').hide();
  $('#animated-btn').fadeOut(1750, ->
    $('.home-thumb').show("fast", ->
      $(this).animate({'margin': '0 60'}, 1000)));

  $('.dropdown-toggle').click ->
    $('.dropdown-menu').toggle("slow")

  $('.dropdown-toggle').click( ->
    setTimeout("$('.dropdown-menu').fadeOut()", 2750))

  $('#signup-link').click( ->
    $('#signup-link').fadeOut('slow', ->
      $('#signup-replacement').fadeIn('slow')))

