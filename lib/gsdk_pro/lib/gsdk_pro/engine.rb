module GsdkPro
  class Engine < ::Rails::Engine
    initializer 'gsdk_pro.setup' do |app|
      # Set the generators templates path to gsdk_pro/lib/templates
      app.config.generators.templates << File.join(config.root, "lib/templates")

      # Do not generate stylesheets when scaffold generator is ran.
      app.config.generators.stylesheets = false

      # No need to wrap in .field_with_error, fields are wrapped in .form-group.
      ActionView::Base.field_error_proc = Proc.new{ |html_tag, instance| html_tag }

      # Add images to assets precompile
      app.config.assets.precompile += Dir.glob(config.root + 'app/assets/images/gsdk_pro/**/*').select{ |f| File.file? f }.map { |m| "gsdk_pro/" +  File.path(m).split("gsdk_pro/").last }
    end

    initializer 'gsdk_pro.sass' do |app|
      # Set the sass load paths
      app.config.sass.load_paths << File.join(config.root, "lib", "sass")

      # Set the add gsdk_pro/lib/sass to assets path
      app.config.assets.paths << File.join(config.root, "lib", "sass")
    end

    initializer 'gsdk_pro.will_paginate', :after => 'will_paginate' do
      ActiveSupport.on_load :action_view do
        if defined?(WillPaginate)
          require "gsdk_pro/extensions/will_paginate"
        end
      end
    end

    initializer 'gsdk_pro.simple_form' do
      ActiveSupport.on_load :action_view do
        if defined?(SimpleForm)
          require "gsdk_pro/extensions/simple_form"
        end
      end
    end

  end
end
