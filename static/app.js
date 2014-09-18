(function() {
  var replies, showReply, socket;

  socket = io();

  replies = $("#replies");

  showReply = function(data) {
    var img, link, reply, row, rows, _i, _len;
    reply = $("<p class='message'/>");
    switch (data.type) {
      case "text":
        rows = data.body.split("\n");
        for (_i = 0, _len = rows.length; _i < _len; _i++) {
          row = rows[_i];
          reply.clone().html(row).appendTo(replies);
        }
        return;
      case "image":
        img = $("<img widht='400' height='400'>").attr('src', data.body);
        reply.html(img);
        break;
      case "link":
        link = $("<a/>").attr('href', data.body).text(data.body);
        reply.html(link);
        break;
      default:
        reply.text(body);
    }
    return reply.appendTo(replies);
  };

  $("#command-input").keydown(function(event) {
    var that;
    if (event.keyCode === 13) {
      that = $(this);
      socket.emit("message", that.val());
      return that.val("");
    }
  });

  socket.on("connect", function(data) {
    return socket.emit("message", "!welcome me");
  });

  socket.on("message", function(data) {
    var err;
    try {
      showReply(data);
    } catch (_error) {
      err = _error;
      console.log("not a JSON");
    }
    return replies.scrollTop(replies.get(0).scrollHeight);
  });

}).call(this);
