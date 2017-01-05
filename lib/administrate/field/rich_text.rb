require "administrate/field/base"
require "administrate/field/rich_text/form_helper"
require "rails"

module Administrate
  module Field
    class RichText < Administrate::Field::Base
      VERSION = "0.0.1"

      class Engine < ::Rails::Engine
        initializer "rich_text.assets" do |app|
          app.config.assets.precompile += %w( administrate-field-rich_text/application.js administrate-field-rich_text/application.scss )
          Administrate::Engine.add_javascript "administrate-field-rich_text/application"
          Administrate::Engine.add_stylesheet "administrate-field-rich_text/application"
        end

        initializer 'rich_text.form_helpers' do
          ActionView::Helpers::FormBuilder.send :include, RichTextFormHelper
        end
      end
    end
  end
end
