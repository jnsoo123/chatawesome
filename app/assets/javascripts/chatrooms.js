$(document).on('turbolinks:load', function() {
  
  $('#chatroom_is_private').change(function(){
    $('#chatroom_password').attr('disabled', !this.checked)
  });
  $('#chatroom_password').attr('disabled', !$('#chatroom_is_private').checked)
  $('.messages').animate({
      scrollTop: $('.messages')[0].scrollHeight
  }, 500);
  
});


