$(document).on 'turbolinks:load ajax:success', ->
  if $('#infinite_scroll').size() > 0
    $(window).on 'scroll', ->
      more_posts_url = $('.pagination a.next_page').attr('href')
      window_height = $(document).height() - $(window).height() - 60
      scrollable = $(window).scrollTop() > window_height
      if more_posts_url && scrollable
        $('#infinite_scroll').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        $.getScript more_posts_url
       return
      return
