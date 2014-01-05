
$ ->
  #Dropdown menu
  $('.dropdown-toggle').click ->
    $('.dropdown-menu').show('fast')
    setTimeout("$('.dropdown-menu').fadeOut()", 2850)

  #sign up animation
  $('#signup-replacement').hide();
  $('#signup-link').hover( ->
    $('#signup-link').fadeOut('fast', ->
      $('#signup-replacement').fadeIn('fast')))

  #nav pills
  $('ul.nav-pills li a').click( ->
    $('ul.nav-pills li.active').removeClass('active')
    $(this).parent('li').addClass('active'))

  $('.home-pills').hide();
  $('.home-pills').fadeIn("slow");


