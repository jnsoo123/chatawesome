$(document).on("ready page:change", function() {
  msgBox = $('#messages')
  msgBox.animate({
      scrollTop: $('#messages')[0].scrollHeight
  }, 500);
});
