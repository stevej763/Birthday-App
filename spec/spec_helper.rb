  # Require our Sinatra Application Base file
  # './' looks in the root folder where app.rb lives
  require './app'

  # Require 
  require 'capybara'
  require 'capybara/rspec'
  require 'rspec'

  # ENV['RACK_ENV'] = 'test'
  
  Capybara.server = :webrick
  Capybara.default_driver = :selenium_chrome
  Capybara.app = BirthdayApp

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
