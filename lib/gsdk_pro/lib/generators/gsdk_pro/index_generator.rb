require "generators/gsdk_pro/page_generator"

module GsdkPro
  module Generators
    class IndexGenerator < PageGenerator
      view_name "index"
      source_root File.expand_path("../templates", __FILE__)

      def set_layout
        inject_into_class "app/controllers/#{name}_controller.rb", "#{name.titleize}Controller".constantize, "  layout '_base'\n"
      end

      def copy_videos
        copy_file "nyc_skyline.webm", "public/videos/nyc_skyline.webm"
        copy_file "nyc_skyline.ogv", "public/videos/nyc_skyline.ogv"
        copy_file "nyc_skyline.mp4", "public/videos/nyc_skyline.mp4"
      end      
    end
  end
end
