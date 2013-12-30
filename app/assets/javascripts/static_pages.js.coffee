$ ->
  $('.home-thumb').hide();
  $('#animated-btn').click ->
    $('#animated-btn').hide("slow", ->
      $('.home-thumb').show("fast", ->
        $(this).animate({'margin-left': '70'}, 1000)));

  $('.dropdown-toggle').click ->
    $('.dropdown-menu').toggle("slow")
