require 'database_cleaner'
require 'capybara/rspec'

RSpec.configure do |config|
  config.include Capybara::DSL
  # Capybara.javascript_driver = :webkit
  Capybara.javascript_driver = :selenium

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    load "#{Rails.root}/spec/support/test_seeds.rb"
  end
 
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
 
  config.before(:each, :js => :true) do
    DatabaseCleaner.strategy = :truncation
  end
 
  config.before(:each) do
    DatabaseCleaner.start
  end
 
  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.expect_with :rspec do |expectations|
    
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  
  config.mock_with :rspec do |mocks|
   
    mocks.verify_partial_doubles = true
  end

  
  config.shared_context_metadata_behavior = :apply_to_host_groups


end
