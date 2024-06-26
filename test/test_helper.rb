# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path("../db/migrate", __dir__)
require "rails/test_help"

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_paths << File.expand_path("fixtures", __dir__)
  ActionDispatch::IntegrationTest.fixture_paths << File.expand_path("fixtures", __dir__)
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_paths.first + "/files"
  ActiveSupport::TestCase.fixtures :all
end

# Add helpers on ActionDispatch::IntegrationTest
class ActionDispatch::IntegrationTest
  protected def authenticate_user(user = nil, password = 'Password1!')
    user ||= @user

    post lato.authentication_signin_action_url, params: { user: {
      email: user.email,
      password: password
    } }
  end
end
