module OfficeAutomationProject
  class Engine < ::Rails::Engine
    isolate_namespace OfficeAutomationProject
    config.to_prepare do

      Dir.glob("../../app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end

    config.generators do |g|
      g.orm :mongoid
    end

  end
end
