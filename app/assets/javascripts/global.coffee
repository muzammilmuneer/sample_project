jQuery(document).on 'turbolinks:load', ->
  line_items = $('#line_items')

  line_items.on 'cocoon:before-insert', (e, el_to_add) ->
    el_to_add.fadeIn(1000)

line_items.on 'cocoon:after-insert', (e, added_el) ->
  added_el.effect('highlight', {}, 500)

line_times.on 'cocoon:before-remove', (e, el_to_remove) ->
  $(this).data('remove-timeout', 1000)
  el_to_remove.fadeOut(1000)