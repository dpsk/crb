require 'database_cleaner'

RSpec.configure do |config|
  config.before(:each) do |example_group|
    DatabaseCleaner.strategy = Capybara.current_driver == :rack_test ? :transaction : :truncation
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end