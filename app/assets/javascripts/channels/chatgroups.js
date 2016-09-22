App.messages = App.cable.subscriptions.create('ChatroomsChannel', {
  received: function(data) {
    return $('#all_channels').append(this.renderChannels(data));
  },

  renderChannels: function(data) {
    return "<div class='col-xs-12' style='margin-bottom: 5px;'><a href='/chatrooms/"+data.id+"' class='btn btn-default btn-lg' style='width: 100%;'>#"+data.channel+"("+data.user_count+")</a></div>";
  }
});
