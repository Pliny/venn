cssTransitionEnd = 'webkitTransitionEnd transitionend oTransitionEnd'

validateEmail = (email) ->
    re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    re.test(email)

class SubState
  constructor : (@from, @to) ->

  preTransition : () ->
    if not not @from and @from?
      $(@from).addClass('invisible')

  postTransition : () ->
    if not not @from and @from?
      $(@from).addClass('hidden')

    $(@to).removeClass('hidden')
    setTimeout(() =>
      $(@to).removeClass('invisible')
    , 0)

$(document).on('ready', () ->
  ss = new SubState "", ".title1"
  ss.postTransition()
)

# $(document).on('click', 'body', () ->
#   ss = new SubState ".title2, .title3, .title4", ".title1"
#   ss.preTransition()
#   $(this).subState = ss
# )

$(document).on('touchstart click', '.title1', () ->
  ss = new SubState ".title1", ".title2, .title3"
  ss.preTransition()
  this['subState'] = ss
)

$(document).on(cssTransitionEnd, '.title1:first', () ->
  if this.subState?
    this.subState.postTransition()
    this.subState = null
    $('input').focus()
)

$(document).on(cssTransitionEnd, '.title3:first, .title4:first, .loader, .title1:first', () ->
  if this.subState?
    this.subState.postTransition()
    this.subState = null
    $('input').focus() if $(this).hasClass('.title1')
)

$(document).on('keyup', 'input', () ->
  if validateEmail($('input').val())
    ss = new SubState ".title3", ".title4"
    ss.preTransition()
    $('.title4')[0]['subState'] = null
    $('.title3')[0]['subState'] = ss
  else
    $('.loader, .success, .fail').addClass('hidden').addClass('invisible')
    ss = new SubState ".title4", ".title3"
    ss.preTransition()
    $('.title3')[0]['subState'] = null
    $(".title4")[0]['subState'] = ss
)


$(document).on('ajax:beforeSend', 'input', () ->
  $('.success, .fail').addClass('hidden').addClass('invisible')
  ss = new SubState "", ".loader"
  ss.postTransition()
)

$(document).on('ajax:success', 'input', () ->
  ss = new SubState ".loader", ".success"
  ss.preTransition()
  $('.loader')[0]['subState'] = ss
)

$(document).on('ajax:error', 'input', () ->
  ss = new SubState ".loader", ".fail"
  ss.preTransition()
  $('.loader')[0]['subState'] = ss
)
