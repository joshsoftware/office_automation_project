module OfficeAutomationProject
  class Engine < ::Rails::Engine
    isolate_namespace OfficeAutomationProject
    config.to_prepare do
      Dir.glob("../../app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end

=begin
    initializer 'our_engine.factories', after: 'factory_girl.set_factory_paths' do
      factories_location = File.expand_path('/home/shweta/project/office_automation_employee/spec/factories', __FILE__)
      p factories_location
      FactoryGirl.definition_file_paths.unshift(factories_location) if defined?(FactoryGirl)
    end
=end
    config.generators do |g|
      g.orm :mongoid
      g.fixture_replacement :factory_girl, dir: 'spec/factories' 
      g.test_framework :rspec, fixture: false
      g.template_engine :haml
    end

  end
end
