socket = io()
replies = $("#replies")

showReply = (data) ->
  reply = $("<p class='message'/>")

  switch data.type
    when "text"
      rows = data.body.split("\n")
      reply.clone().html(row).appendTo replies for row in rows
      return
    when "image"
      img = $("<img widht='400' height='400'>").attr('src', data.body)
      reply.html(img)
    when "link"
      link = $("<a/>").attr('href', data.body).text(data.body)
      reply.html(link)
    else
      reply.text body

  reply.appendTo replies

$("#command-input").keydown (event) ->
  if event.keyCode is 13
    that = $(this)
    socket.emit "message", that.val()
    that.val ""

socket.on "connect", (data) ->
  socket.emit "message", "!welcome me"

socket.on "message", (data) ->
  try
    showReply data
  catch err
    console.log "not a JSON"

  replies.scrollTop replies.get(0).scrollHeight
