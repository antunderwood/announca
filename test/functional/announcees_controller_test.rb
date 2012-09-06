require 'test_helper'

class AnnounceesControllerTest < ActionController::TestCase
  setup do
    @announcee = announcees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:announcees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create announcee" do
    assert_difference('Announcee.count') do
      post :create, announcee: { email: @announcee.email, first_name: @announcee.first_name, last_name: @announcee.last_name }
    end

    assert_redirected_to announcee_path(assigns(:announcee))
  end

  test "should show announcee" do
    get :show, id: @announcee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @announcee
    assert_response :success
  end

  test "should update announcee" do
    put :update, id: @announcee, announcee: { email: @announcee.email, first_name: @announcee.first_name, last_name: @announcee.last_name }
    assert_redirected_to announcee_path(assigns(:announcee))
  end

  test "should destroy announcee" do
    assert_difference('Announcee.count', -1) do
      delete :destroy, id: @announcee
    end

    assert_redirected_to announcees_path
  end
end
