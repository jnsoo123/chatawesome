App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages_"+data.topic).removeClass('hidden')
    $("#message_field").val("")
    $("#messages_"+data.topic).append(this.renderMessage(data));
    return $('#messages_'+data.topic).animate({
        scrollTop: $('#messages_'+data.topic)[0].scrollHeight
    }, 500);
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});
