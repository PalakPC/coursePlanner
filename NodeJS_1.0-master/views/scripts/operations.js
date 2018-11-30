//Script to print table.

$(document).ready(function() {
   jQuery('#wrapper').val("");
   $('#run_button').click(function() {
      var params = {
         query: jQuery('#input_query_box').val()
      };
      $.getJSON("/inputQuery", params, function(result) {
         $.each(result, function(key, val) {
            var th = $('<tr></tr>');
            var tr = $('<tr></tr>');
            $.each(val, function(k, v) {
               if(key == 0) {
                  $('<th>'+k+'</th>').appendTo(th);
               }
               $('<td>'+v+'</td>').appendTo(tr);
            });		
            th.appendTo('#display');
            tr.appendTo('#display');
         });
      });
   });
});
