require 'test_helper'

class ChoresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

<<<<<<< HEAD
  test "should get show" do
    get :show
    assert_response :success
  end

=======
>>>>>>> master
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

<<<<<<< HEAD
=======
  test "should get edit" do
    get :edit
    assert_response :success
  end

>>>>>>> master
  test "should get update" do
    get :update
    assert_response :success
  end

<<<<<<< HEAD
  test "should get edit" do
    get :edit
=======
  test "should get show" do
    get :show
>>>>>>> master
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
