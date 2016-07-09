// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('#datepicker-infdate').datepicker();
$("#datepicker-infdate").on("changeDate", function(event) {
    $("#my_hidden_input").val(
        $("#datepicker").datepicker('getFormattedDate')
     )
});