require("tinymce/tinymce")
require("tinymce/themes/silver/theme.min.js")
require("tinymce/skins/ui/oxide/skin.min.css")
require("tinymce/skins/ui/oxide/content.min.css")
require("tinymce/skins/content/default/content.css")
require("tinymce/plugins/autolink")
require("tinymce/plugins/preview")
require("tinymce/plugins/image")
require("tinymce/plugins/imagetools")
require("tinymce/plugins/link")
require("tinymce/plugins/media")
require("tinymce/plugins/table")
require("tinymce/plugins/lists")
require("tinymce/plugins/wordcount")
require("tinymce/plugins/help")
require("tinymce/plugins/quickbars")

tinymce.init({
  selector: "textarea#story_body", 
  menubar: false,
  plugins: 'preview autolink image link media table lists wordcount imagetools help quickbars',
  toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | insertfile image media template link anchor | preview pastetext',
  toolbar_sticky: true,
  init_instance_callback: function (editor) {
    editor.on('KeyUp', function (e) {
      body = tinymce.activeEditor.getContent();
      $('#story_body_preview').html(body);
    });

    editor.on('Change', function (e) {
      body = tinymce.activeEditor.getContent();
      $('#story_body_preview').html(body);
    });
  }
});
