$(function(){

  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".preview");
    if(file.type.indexOf("image") < 0){
      return false;
    }

    reader.onload = (function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "100%",
                  class: "preview",
              }));
    });
    reader.readAsDataURL(file);
  });
});

