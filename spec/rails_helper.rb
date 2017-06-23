ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'devise'
require 'factory_girl_rails'
require 'shoulda/matchers'
require 'support/database_cleaner'
require 'capybara/poltergeist'
require 'capybara-screenshot/rspec'

include Warden::Test::Helpers

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    phantomjs_logger: Rails.root.join('log', 'poltergeist.log'),
    inspector: true
  )
end

Capybara.javascript_driver = :poltergeist

Capybara.server_port = 3001
Capybara.app_host = 'http://localhost:3001'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include Rails.application.routes.url_helpers
  config.include Warden::Test::Helpers
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include FeatureHelpers, type: :feature

end
