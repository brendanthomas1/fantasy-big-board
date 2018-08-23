App.draftChannel = App.cable.subscriptions.create { channel: 'DraftChannel' },
  received: (data) ->
    return unless data['player']
    nodeId = 'player-' + data['player']['id'] + '-node'
    node = document.getElementById(nodeId).cloneNode(true)
    node.innerHTML = data['content']
    node.classList.toggle('drafted')
    document.getElementById(nodeId).replaceWith(node)
