ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

module ResponseHelper
  SUCCESS_STATUS = Api::ApplicationController::SUCCESS_STATUS
  ERROR_STATUS = Api::ApplicationController::ERROR_STATUS

  def body
    Oj.load(response.body)
  end

  def data
    body["data"]
  end

  def message
    body["message"]
  end

  def status
    body["status"]
  end
end

class ActionDispatch::IntegrationTest
  include ResponseHelper
end
