$(document).on('turbolinks:load', function() {
  msgBox = $('#messages')
  msgBox.animate({
      scrollTop: $('#messages')[0].scrollHeight
  }, 500);
});
