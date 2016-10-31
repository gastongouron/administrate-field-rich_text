module RichTextViewHelper
  def render_rich_text value
    "<div class=\"quill-viewer\" data-quill-contents=\"#{Base64.encode64(value)}\"></div>".html_safe
  end

  def render_plain_text value
    json = JSON.parse(value)
    json['ops'].reduce('') do |text, delta|
      text += delta['insert']  if delta['insert']
      text
    end
  end
end
