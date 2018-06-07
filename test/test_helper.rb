require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "mocha/minitest"

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

  def msg
    body["message"]
  end

  def status
    body["status"]
  end
end

module LoginHelper
  def sign_in(user = User.create!(username: "helper", password: "111111"))
    ApplicationController.any_instance.stubs(:current_user).returns(user)
  end
end

class ActionDispatch::IntegrationTest
  include ResponseHelper
  include LoginHelper
end
