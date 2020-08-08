$(document).on('turbolinks:load', ()=> {
  function buildHTML(comment){
    let html =
    `<div class='mx-2 my-2'>
      <div class='index__box--name'><p><a link_to = "user_path(c.user_id)">${comment.username}さん</a></p></div>
      <div class='index__box--content'>${comment.content}</div>
      </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.comment').append(html);
      $('.textarea').val('');
      $('.comment').animate({ scrollTop: $('.comment')[0].scrollHeight});
      $('.is-block my-3 comment_body').prop('disabled', false);
    })
    .fail(function(){
      alert('コメントを入力してください');
    })
  })

  $('.product__topContent__commentBox__head').on('click', function(e){
    e.preventDefault();
    $('.product__topContent__commentBox__index').animate({scrollTop:0});
  })
})
