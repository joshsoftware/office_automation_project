source "https://rubygems.org"

# Declare your gem's dependencies in office_automation_project.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
gem 'mongoid', github: 'mongoid/mongoid'
gem 'office_automation_employee', path: '/home/shweta/project/office_automation_employee'
gem 'jquery-rails'
gem 'turbolinks'
gem 'therubyracer'
gem 'sass-rails', '~> 4.0.2'
gem 'haml-rails'
gem 'simple_form'
gem 'bootstrap-sass'
gem 'aasm' #act_as_state_machine for status in project model
gem 'cancan'

group :test do
  gem 'rspec-rails'
  gem 'mongoid-rspec'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'simplecov', '~> 0.7.1'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
end
