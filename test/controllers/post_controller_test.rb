require 'test_helper'

class PostControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get show_category" do
    get :show_category
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get new_complete" do
    get :new_complete
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get edit_complete" do
    get :edit_complete
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
