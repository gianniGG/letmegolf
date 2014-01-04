
$ ->
  #Dropdown menu
  $('.dropdown-toggle').hover ->
    $('.dropdown-menu').show('fast')
    setTimeout("$('.dropdown-menu').fadeOut()", 3123)

  #sign up animation
  $('#signup-replacement').hide();
  $('#signup-link').hover( ->
    $('#signup-link').fadeOut('fast', ->
      $('#signup-replacement').fadeIn('fast')))

  #nav pills
  $('ul.nav-pills li a').click( ->
    $('ul.nav-pills li.active').removeClass('active')
    $(this).parent('li').addClass('active'))

