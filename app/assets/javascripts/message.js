$(function() {

  function buildComment(comment){
    var default_image = `<div class="userIcon__defaultImage">
                          <i class="fas fa-user-alt fa-lg"></i>
                        </div>`
    var user_image = `<img class="userIcon__image" src="${comment.image.url}">`
    var image = comment.image ? user_image : default_image;
    var html = `<div class="comment clearfix">
                  <div class="userIcon">
                    ${image}
                  </div>
                  <div class="contents">
                    <div class="contents__username">
                      ${comment.name}
                    </div>
                    <div class="contents__message">
                      ${comment.text}
                    </div>
                  </div>
                 </div>`
    return html;
  }

  $('.new-message').on('submit', function(e) {
   e.preventDefault();
   $('.btn-primary').removeAttr('data-disable-with');
   var formData = new FormData(this);
   var url = $(this).attr('action');
   $.ajax({
     type: 'POST',
     url: url,
     data: formData,
     dataType: 'JSON',
     processData: false,
     contentType: false
   })
   .done(function(comment) {
     var html = buildComment(comment);
     $('.comments__content').prepend(html);
     $('#message-box').val('');
   })
  })
});
