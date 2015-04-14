require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get open_tasks" do
    get :open_tasks
    assert_response :success
  end

  test "should get my_tasks" do
    get :my_tasks
    assert_response :success
  end

  test "should get create_task" do
    get :create_task
    assert_response :success
  end

end
