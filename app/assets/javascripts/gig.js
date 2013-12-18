$(document).ready (function () {

var artists = [];

$('#add_artist').click(function () {
    $('<li/>').text( $('#artist').val() ).appendTo('#artists_display');

    artists.push( $('#artist').val() );
    $('#artist').val('').focus();

    $('#artist_names').val( artists.join(',') );
    console.log(artists);
});


});