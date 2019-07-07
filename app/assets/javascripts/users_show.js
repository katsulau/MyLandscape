$(function() {
  $(document).on('click','#myposts-btn', function() {
    $("#favorites").removeClass("active");
    $("#myposts").addClass("active");
  });
  $(document).on('click', '#favorites-btn', function(){
    $("#myposts").removeClass("active");
    $("#favorites").addClass("active");
  });
});