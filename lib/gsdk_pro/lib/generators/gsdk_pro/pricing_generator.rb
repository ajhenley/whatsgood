require "generators/gsdk_pro/page_generator"

module GsdkPro
  module Generators
    class PricingGenerator < PageGenerator
      view_name "pricing"

      def set_layout
        inject_into_class "app/controllers/#{name}_controller.rb", "#{name.titleize}Controller".constantize, "  layout '_base'\n"
      end
    end
  end
end
