module GsdkPro
  module Generators
    class CustomizeGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Installs required files to fully customize your get shit done pro theme."

      def copy_stylesheet
        copy_file "gsdk_pro.scss", "app/assets/stylesheets/gsdk_pro.scss"
      end

      def show_readme
        readme "README_CUSTOMIZE" if behavior == :invoke
      end
    end
  end
end
