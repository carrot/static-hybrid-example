staff = []

$.get config.api_url, (res) ->
  staff = res.data[config.static_items..]

$('.more').on 'click', ->
  $('ul').append(templates.staff(staff: staff[0]))
  staff.splice(0, 1)