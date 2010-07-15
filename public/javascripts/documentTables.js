$(document).ready(function() {
	$('#documents_table').dataTable({
    "sPaginationType": "full_numbers", 
	  "bLengthChange": false, 
	  "iDisplayLength": 50,
	  "bProcessing": true,
	  "bFilter" :false,
	  "bAutoWidth": false
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

    