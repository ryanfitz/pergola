// Put your application scripts here

$(document).ready(function () {
  myLayout = $('body').layout({ 
    west__showOverflowOnHover: true,  
	  closable:	true,	
	  resizable: true,
  	slidable:	true,
  	south__size: 50
	  });
	  
  $("#add_connection").button({
    icons: {
      primary: 'ui-icon-plusthick'
    },
    text: false
  });
  
  $.jstree._themes = "/stylesheets/themes/";
  
  $("#connections").jstree({
    "themes" : {
      "theme" : "default",
      "dots" : false,
      "icons" : false
    },
    "plugins" : [ "themes", "html_data" ]
  });
  

});