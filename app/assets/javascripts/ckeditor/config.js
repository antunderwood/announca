CKEDITOR.editorConfig = function( config )
{
  config.toolbar = 
  [
      { name: 'document', items : [ 'Preview' ] },
      { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
      { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','Scayt' ] },
      { name: 'insert', items : [ 'Image','Link','Unlink','Table','HorizontalRule','Smiley','SpecialChar'] },
      { name: 'styles', items : [ 'Format' ] },
      { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
      { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote' ] },
  ];
  config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
  config.filebrowserUploadUrl = "/ckeditor/attachment_files";
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
  config.filebrowserImageUploadUrl = "/ckeditor/pictures"
  config.uiColor = '#9AB8F3';
  config.height = "500"
};