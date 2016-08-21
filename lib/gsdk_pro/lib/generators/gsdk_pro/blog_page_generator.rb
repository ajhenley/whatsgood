require "generators/gsdk_pro/page_generator"

module GsdkPro
  module Generators
    class BlogPageGenerator < PageGenerator
      view_name "blog_page"

      def set_layout
        inject_into_class "app/controllers/#{name}_controller.rb", "#{name.titleize}Controller".constantize, "  layout '_base'\n"
      end
    end
  end
end
