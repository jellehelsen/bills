// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $.datepicker.setDefaults( $.datepicker.regional[ "nl" ] );
  $( "#bill_due_date" ).datepicker( $.datepicker.regional[ "nl" ] );
});
