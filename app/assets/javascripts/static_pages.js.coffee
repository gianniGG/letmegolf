
$ ->
  #Dropdown menu hide or show on hover etc
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

  #highlight the clicked nav pill
  highlightPill = (pathname) ->
    unless pathname == "/"
      $('.nav li.active').removeClass('active')
      $('.nav li.' + pathname[1..-1].split('/')[0]).addClass('active')

  highlightPill(window.location.pathname)

