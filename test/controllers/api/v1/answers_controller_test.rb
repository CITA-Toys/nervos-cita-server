require 'test_helper'

class Api::V1::AnswersControllerTest < ActionDispatch::IntegrationTest
  def params
    {
      content: [
        {
          "q": "q1",
          "a": "a1"
        },
        {
          "q": "q2",
          "a": "a2"
        }
      ]
    }
  end

  test "create a answer" do
    post "/api/v1/answers", params: params
    assert body["status"], Api::ApplicationController::SUCCESS_STATUS
    assert_not body["data"].nil?
  end

  test "content empty error" do
    post "/api/v1/answers", params: {}
    assert body["status"], Api::ApplicationController::ERROR_STATUS
    assert_not body["message"].nil?
  end

  def body
    Oj.load(response.body)
  end
end
