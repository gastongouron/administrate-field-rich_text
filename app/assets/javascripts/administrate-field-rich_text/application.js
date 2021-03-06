//= require administrate-field-rich_text/quill.min

var init = function () {
  $('.quill-editor').each(function () {
    var el = this;
    var $input = $(this).siblings('.quill-input');
    var quill = new Quill(el, {
      modules: { toolbar: true },
      theme: 'snow'
    });
    $input.val(quill.root.innerHTML);
    quill.on('text-change', function () {
      $input.val(quill.root.innerHTML);
    });
  });
};

if (window['Turbolinks']) {
  document.addEventListener('turbolinks:load', init);
} else {
  $(init);
}
