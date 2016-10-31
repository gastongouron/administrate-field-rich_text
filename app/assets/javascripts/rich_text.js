//= require quill.min

$(function () {
  $('.quill-editor').each(function () {
    var el = this;
    var $input = $(this).siblings('.quill-input');
    var quill = new Quill(el, {
      modules: { toolbar: true },
      theme: 'snow'
    });
    try {
      var contents = JSON.parse(atob($(el).data('quill-contents')));
      quill.setContents(contents);
    } catch (e) {
      // No need to do anything, simply start with an empty editor.
    }
    $input.val(JSON.stringify(quill.getContents()));
    quill.on('text-change', function () {
      $input.val(JSON.stringify(quill.getContents()));
    });
  });
  $('.quill-viewer').each(function () {
    var quill = new Quill(this, { readOnly: true });
    quill.setContents(JSON.parse(atob($(this).data('quill-contents'))));
  });
});
