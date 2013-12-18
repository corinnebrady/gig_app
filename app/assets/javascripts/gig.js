$(document).ready (function () {

var artists = [];

$('#add_artist').click(function () {
    var $input = $('<input>', {name: "new_artist[]"}).val($('#artist').val());
    $('<li/>').html($input).prependTo('#artists_display');

    // artists.push( $('#artist').val() );
    $('#artist').val('').focus();

    // $('#artist_names').val( artists.join(',') );
    // console.log(artists);
});



});