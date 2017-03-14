@fetchPeople = ->
  page = $(this).attr('value')
  per_page = $('#sel_ppl_per_page option:selected').attr('value')
  $.get
    data:
      page: page
      per_page: per_page
    url: '/fetch_people'

$(document).on 'change', '#sel_ppl_per_page', @fetchPeople
$(document).on 'click', '.people-page:not(.active)', @fetchPeople
