
$ ->
  #Dropdown menu
  $('.dropdown-menu').hide();

  $('.dropdown-toggle').mouseenter ->
    clearTimeout $('.dropdown-menu').data('timeout')
    $('.dropdown-menu').slideDown('medium')

  $('.dropdown-toggle').mouseleave ->
    timeout = setTimeout("$('.dropdown-menu').fadeOut()", 500)
    $('.dropdown-menu').data('timeout', timeout)

  $('.dropdown-menu').mouseleave ->
    timeout = setTimeout("$('.dropdown-menu').fadeOut()", 650)
    $('.dropdown-menu').data('timeout', timeout)

  $('.dropdown-menu').mouseenter ->
    clearTimeout $('.dropdown-menu').data('timeout')




  #sign up animation
  $('#signup-replacement').hide();
  $('#signup-link').hover( ->
    $('#signup-link').fadeOut('fast', ->
      $('#signup-replacement').fadeIn('fast')))

  #nav pills
  $('ul.nav-pills li a').click( ->
    $('ul.nav-pills li.active').removeClass('active')
    $(this).parent('li').addClass('active'))

  #carousel
  $('.carousel-control').on('click', ->
    $('.item.active').fadeOut("slow", ->
      $('.item.active').removeClass('active')
      $('.item',this).addClass('active')
      $('.item.active').fadeIn("slow") ) )


  #highlight the clicked nav pill
  highlightPill = (pathname) ->
    unless pathname = "/"
      $('.nav li.active').removeClass('active')
      $('.nav li.' + pathname[1..-1]).addClass('active')

  highlightPill(window.location.pathname)





