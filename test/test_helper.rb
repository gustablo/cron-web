ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def log_in_as(user)
    post sessions_authenticate_path, params: { user: { email: user.email, password: 'password' } }
  end
  # Add more helper methods to be used by all tests here...
end
