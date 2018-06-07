require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "new" do
    get new_session_url

    assert_response :success
  end

  class CreateSessionTest < SessionsControllerTest
    def setup
      @username = "test"
      @password = "111111"
      @user = User.create!(username: @username, password: @password)
    end

    test "login success" do
      post "/sessions", params: { session: { username: @username, password: @password } }
      assert session[:user_id], @user.id
      assert_redirected_to root_path
    end

    test "user not found" do
      post "/sessions", params: { session: { username: "test1", password: @password } }
      assert_nil session[:user_id]
      assert_redirected_to root_path
    end

    test "password error" do
      post "/sessions", params: { session: { username: @username, password: "111112" } }
      assert_nil session[:user_id]
      assert_redirected_to root_path
    end
  end

  class DestroySessionTest < SessionsControllerTest
    test "not login" do
      delete "/sessions"
      assert_redirected_to root_path
    end

    test "log out success" do
      sign_in
      delete "/sessions"
      assert_redirected_to root_path
    end
  end
end
