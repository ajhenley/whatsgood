module GsdkPro
  module Generators
    class KaminariGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc "Copy Get Shit Done Pro's custom kaminari layouts to your project."

      def copy_layouts
        directory "views/kaminari", 'app/views/kaminari' if defined?(Kaminari)
      end
    end
  end
end
