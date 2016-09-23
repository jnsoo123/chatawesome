$(document).on('turbolinks:load', function() {
  $('.messages').animate({
      scrollTop: $('.messages')[0].scrollHeight
  }, 500);
});
