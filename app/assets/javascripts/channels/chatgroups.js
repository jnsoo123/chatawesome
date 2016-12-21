App.messages = App.cable.subscriptions.create('ChatroomsChannel', {
  received: function(data) {
    return $('#all_channels').append(this.renderChannels(data));
  },

  renderChannels: function(data) {
    return "<div class='col-xs-12' style='margin-bottom: 5px;'><a href='/chatrooms/"+data.id+"' class='btn btn-primary' style='width: 100%;'><div class='clearfix'><span class='pull-left'>#"+data.channel+" ( "+data.user_count+" <i class='fa fa-user'></i> ) <span class='label label-danger'>New</span></span><span class='pull-right'>"+(data.lock ? "<i class='fa fa-lock'></i>" : "")+"</span></div></a></div>";
  }
});
