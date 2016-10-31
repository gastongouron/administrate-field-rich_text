module RichTextFormHelper
  def rich_text_field method, options={}
    name = @object_name + "[#{method}]"
    id = options[:id] || @object_name + "_#{method}"
    "<div class=\"quill-editor\" data-quill-contents=\"#{Base64.encode64(@object.send(method))}\"></div><input type=\"hidden\" class=\"quill-input\" name=\"#{name}\" id=\"#{id}\">".html_safe
  end
end
