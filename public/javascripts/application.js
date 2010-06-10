// Put your application scripts here

$(document).ready(function () {
  myLayout = $('body').layout({ 
    west__showOverflowOnHover: true,  
	  closable:	true,	
	  resizable: true,
  	slidable:	true,
  	south__size: 0
	  });
	  
  $("#add_connection").button({
    icons: {
      primary: 'ui-icon-plusthick'
    },
    text: false
  });
  
});