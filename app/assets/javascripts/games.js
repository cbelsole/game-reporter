// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('change', '#game_use_game_clock', function (event) {
  if(event.target.checked) {
    $("#game_time_per_round").prop( "disabled", false );
  } else {
    $("#game_time_per_round").prop( "disabled", true );
  }
});
