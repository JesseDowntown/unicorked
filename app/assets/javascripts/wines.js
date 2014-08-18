// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.

$(document).ready(function(){

  $('.color-selector').change(function(){
    var selectedColor = $("input:checked").val();

    console.log('the color is:' + selected);
  });

});