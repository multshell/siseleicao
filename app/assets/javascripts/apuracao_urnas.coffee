# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#apuracao').dataTable({
        autoWidth: true,
        "order": [ 1, 'asc' ],
        "lengthMenu": [ 10, 10, 25, 50, 75, 100 ]
    });