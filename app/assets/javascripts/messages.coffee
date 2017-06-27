$(document).on 'turbolinks:load ajax:success', ->
  $('.select2').select2()
  $('.select2-tags').select2({ tags: true })

  $('#new_message').on 'hide.bs.collapse', ->
    $('#flash_messages').append '<div class="alert alert-info" role="alert">' +
      '<button class="close" data-dismiss="alert"> × </button>' +
      'Message sent!' +
      '</div>'
