App.messages = App.cable.subscriptions.create {
    channel: 'MessagesChannel'
    # messages_#{params['user_id']}_channel
  },
  connected: ->
    console.log('connected to messages channel')

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.message.blank?
      $('#messages .list-group').prepend data.message
