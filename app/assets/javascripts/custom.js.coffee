$(document).on('click', '.title1', () ->
  $('.title1').toggleClass('invisible')
)

transitionCallback = () ->
  $('.title3, .title2, .title1').toggleClass('hidden')
  setTimeout(() ->
    $('.title2, .title3').toggleClass('invisible')
    $('input').focus()
  , 0)

$(document).on('webkitTransitionEnd transitionend oTransitionEnd', '.title1:first', transitionCallback)

$(document).on('ajax:beforeSend', 'input', () ->
  $('.loader').toggleClass('invisible').toggleClass('hidden')
  $('.success, .fail').addClass('invisible').addClass('hidden')
)

$(document).on('ajax:success', 'input', () ->
  $('.loader').toggleClass('invisible')
  setTimeout(() ->
    $('.loader, .success').toggleClass('hidden')
    $('.success').toggleClass('invisible')
  , 500)
)

$(document).on('ajax:error', 'input', () ->
  $('.loader').toggleClass('invisible')
  setTimeout(() ->
    $('.loader, .fail').toggleClass('hidden')
    $('.fail').toggleClass('invisible')
  , 500)
)

$(document).on('keyup', 'input', (e) ->
  if e.keyCode is 50
    $('.title3').toggleClass('invisible')
    setTimeout(() ->
      $('.title3, .title4').toggleClass('hidden')
      setTimeout(() ->
        $('.title4').toggleClass('invisible')
      , 0)
    , 500)
)

