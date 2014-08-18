// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.

$(document).ready(function(){

  function createGrapeVarietyOptions(array) {
    // add array as a collection of options to the form
    $.each(array, function(index, value) {
      $('#wine_grape_variety').append('<option value='+index+'>'+value+'</option>' );
    });
  }

  $('.color-selector').change(function(){
    // grab value from radio buttons
    var selectedColor = $("input:checked").val();
    // clear out existing collection
    $('#wine_grape_variety').empty();
    // request data for collection
    $.get("/get_grape_varieties", { color: selectedColor }, function (data) {
          createGrapeVarietyOptions(data);
      }, "json");
  });

});