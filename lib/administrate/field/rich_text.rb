require "administrate/field/base"
require "administrate/field/rich_text/form_helper"
require "administrate/field/rich_text/view_helper"
require "rails"

module Administrate
  module Field
    class RichText < Administrate::Field::Base
      VERSION = "0.0.1"

      class Engine < ::Rails::Engine
        initializer "rich_text.assets" do |app|
          app.config.assets.precompile += %w( rich_text.js rich_text.scss )
          Administrate::Engine.add_javascript "rich_text"
          Administrate::Engine.add_stylesheet "rich_text"
        end

        initializer "rich_text.view_helpers" do
          ActionView::Base.send :include, RichTextViewHelper
        end

        initializer 'rich_text.form_helpers' do
          ActionView::Helpers::FormBuilder.send :include, RichTextFormHelper
        end
      end
    end
  end
end
