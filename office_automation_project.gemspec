$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "office_automation_project/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "office_automation_project"
  s.version     = OfficeAutomationProject::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     =["Shweta"]
  s.email       = ["joshofficeautomation@gmail.com"]
  s.homepage    = "https://github.com/joshsoftware/office_automation_project"
  s.summary     = "Mountable engine for project management"
  s.description = "Mountable engine for project management. It can perform tasks like creating project, assigning team members, storing contact details of client, and admin, project manager will be able to see who all are free"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.4"
end
