App.draftChannel = App.cable.subscriptions.create { channel: 'DraftChannel' },
  received: (data) ->
    return unless data['player']
    nodeId = 'player-' + data['player']['id'] + '-node'
    node = document.getElementById(nodeId).cloneNode(true)
    node.innerHTML = data['content']
    node.classList.toggle('drafted')
    message = "#{data['player']['name']} #{if data['player']['drafted'] then 'drafted' else 'undrafted'} "
    console.log message
    Materialize.toast(message, 4000)
    document.getElementById(nodeId).replaceWith(node)
