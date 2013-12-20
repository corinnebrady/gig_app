$(document).ready (function () {

  var artists = [];

  $('#add_artist').click(function () {

    if ($('#artist').val() === '') {
      return
    }

    var $input = $('<input>', {name: "new_artist[]"}).val($('#artist').val());
    $('<li/>').html($input).prependTo('#artists_display');

    $('#artist').val('').focus();
  });



});