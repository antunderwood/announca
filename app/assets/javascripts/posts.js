$(".publish_post").live('click', function () {
	element_clicked = $(this);
	post_id = element_clicked.attr('data-post-id');
	$.ajax({
	  beforeSend: function(){$("#publishing_spinner").html("&nbsp;<img src='/assets/spinner.gif'>");},
	  type: 'PUT',
	  url: "/posts",
	  data: {id: post_id, publish: true}
	});
});