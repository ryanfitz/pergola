// Put your application scripts here

function remove_active() {
  $('#page_nav ul li').removeClass('active');
}

function activate_link(div) {
  remove_active();
  $(div).addClass('active');
}

$(document).ready(function () {	 
  
  $('.database').click(function () { 
    $('.database h3').removeClass("selected");
    $(this).find('h3').addClass("selected");
  });

  $('.arrow').toggle(
    function() {
      $(this).html("\u25BC");
      $(this).parent().parent().find('.collections').addClass("show");
    },
    function() {
      $(this).html("\u25BA");
      $(this).parent().parent().find('.collections').removeClass("show");
    }
  );
  
  $('#page_nav ul li a').click(function() {
    remove_active();
    $(this).parent().addClass('active');
  });
  
});