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

validateEmail = (email) ->
    re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    re.test(email)

$(document).on('keyup', 'input', (e) ->
  if validateEmail($('input').val())
    $('.title3').addClass('invisible')
    setTimeout(() ->
      $('.title3').addClass('hidden')
      $('.title4').removeClass('hidden')
      setTimeout(() ->
        $('.title4').removeClass('invisible')
      , 0)
    , 500)
  else
    $('.loader, .success, .fail').addClass('hidden')
    $('.title4').addClass('invisible')
    setTimeout(() ->
      $('.title4').addClass('hidden')
      $('.title3').removeClass('hidden')
      setTimeout(() ->
        $('.title3').removeClass('invisible')
      , 0)
    , 500)
)

