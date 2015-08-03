$(document).on 'input', '.line-item-amount', ->
  update_total()
  return

$(document).on 'cocoon:after-remove', '.new_purchase', ->
  update_total()
  return

update_total = () ->
  amount = _.map($('.line-item-amount'), (item) ->
              parseFloat item.value || 0
            ).reduce ((sum, el) ->
              sum + el
            ), 0
  $('.total').text(amount)
