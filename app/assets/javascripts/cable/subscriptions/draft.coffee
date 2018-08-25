App.draftChannel = App.cable.subscriptions.create { channel: 'DraftChannel' },
  received: (data) ->
    return unless data['player']
    nodeId = 'player-' + data['player']['id'] + '-node'
    node = document.getElementById(nodeId).cloneNode(true)
    node.innerHTML = data['content']
    node.classList.toggle('drafted')
    message = "#{if data['player']['drafted'] then 'Drafted' else 'Undrafted'} #{data['player']['name']} at #{new Date().toLocaleTimeString()}"
    console.log message
    document.getElementById(nodeId).replaceWith(node)
