$(document).ready(function() {
  //Show options (edit and delete) on hover
	$('#editable-list li.note-cell .thumbnail #option-links').hide();
  $('#editable-list li.note-cell .thumbnail #option-links-filler').show();

	$('#editable-list li.note-cell').hover(
    function () {
      $(this).find('.thumbnail #option-links').show();
      $(this).find('.thumbnail #option-links-filler').hide();
  },
    function () {
      $(this).find('.thumbnail #option-links').hide();
      $(this).find('.thumbnail #option-links-filler').show();
  });

  //Edit and delete links
  $('#editable-list li.note-cell').
    on('mousedown', '#edit-note-container form #cancel-edit-button', function() {
      $(this).parent().attr('data-remote', 'true');
    }).
    on('click', '#edit-note-container form #cancel-edit-button', function() {
      $(this).parent().parent().attr('id', 'current-edit-note-container');
    }).
    on('click', '#note-container #edit-note-link', function() {
      $(this).parent().parent().parent().attr('id', 'current-note-container');
    }).
    on('mousedown', '#note-container #delete-link', function() {
      $('#confirm-delete #delete-button').attr('href', $(this).data('path'));
  });
});

$( document ).ajaxComplete(function() {
  $('#editable-list li.note-cell .thumbnail #option-links').hide();
  $('#editable-list li.note-cell .thumbnail #option-links-filler').show();
});
