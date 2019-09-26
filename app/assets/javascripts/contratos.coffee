# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#contratos').dataTable({
        autoWidth: true,
        "lengthMenu": [ 50, 10, 25, 75, 100 ]
    });
