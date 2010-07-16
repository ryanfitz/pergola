$(document).ready(function() {
	$('#documents_table').dataTable({
    "sPaginationType": "full_numbers", 
    "bPaginate": false,
    "bInfo": false,
	  "bLengthChange": false, 
	  "bProcessing": true,
	  "bFilter" :false,
	  "bAutoWidth": false,
    "aoColumns": [null, { "bSortable": false }]
	  });
	
	$(":checkbox").click(function() {
	  var ids = new Array();
	  $("input:checked").each(function(index) {
	    ids.push($(this).attr("value"));
	    
	    if ( $("input:checked").length -1 == index) {
	      alert(ids.toString());
	    }
	  })
  });
  
});

    