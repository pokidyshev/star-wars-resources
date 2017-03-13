$ ->
  $('.pagination li:first').addClass('active')

$(document).on 'click', '.pagination li a', ->
  $('.pagination li.active').removeClass('active')
  $(this).parent().addClass('active')
