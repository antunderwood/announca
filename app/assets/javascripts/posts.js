$(".publish_post").live('click', function () {
  element_clicked = $(this);
  if (element_clicked.attr('disabled') != "disabled"){
    element_clicked.attr('disabled', 'disabled');
    element_clicked.prev(".publishing_spinner").html("&nbsp;<img src='/assets/spinner.gif'>");
    post_id = element_clicked.attr('data-post-id');
    $.ajax({
      type: 'PUT',
      url: "/posts",
      data: {id: post_id, publish: true}
    });
  }
});