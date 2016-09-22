App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    $("#message_field").val("")
    $('#messages').append(this.renderMessage(data));
    return $('#messages').animate({
        scrollTop: $('#messages')[0].scrollHeight
    }, 500);
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});
