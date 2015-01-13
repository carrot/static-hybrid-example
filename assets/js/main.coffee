staff = []

$.get 'http://api.bycarrot.com/staff', (res) ->
  staff = res.data[10..]

$('.more').on 'click', ->
  $('ul').append(templates.staff(staff: staff[0]))
  staff.splice(0, 1)