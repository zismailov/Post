$(document).on 'turbolinks:load ajax:success', ->
  $('.select2-tags').select2({
    tags: true
  })
