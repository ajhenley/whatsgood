module GsdkPro
  module Generators
    class DeviseGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc "Copy Get Shit Done Pro's custom Devise layouts to your project."

      def copy_layouts
        directory "views/devise/erb/form_for", 'app/views/devise' unless defined?(SimpleForm)
        directory "views/devise/erb/simple_form_for", 'app/views/devise' if defined?(SimpleForm)
      end
    end
  end
end
