jQuery(document).ready(function($) {
  $('#feedback_form').live('ajax:success', function(event, data, status) {
    $('#feedback_slider p').fadeIn('slow', function() { 
      $('#feedback_slider').slideUp(function() {
        $('#feedback_slider p').hide();
        $('#feedback_slider textarea').val('');
      });
    });
    return false;
  });
  
  $('#feedback_nib a').click(function() {
    if ($('#feedback_slider').is(':hidden')) {
      $('#feedback_slider').slideDown();
      $('#feedback_slider textarea').focus();
    } else {
      $('#feedback_slider').slideUp();
    }
    return false;
  });
});
