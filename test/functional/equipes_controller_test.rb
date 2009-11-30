require 'test_helper'

class EquipesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipe" do
    assert_difference('Equipe.count') do
      post :create, :equipe => { }
    end

    assert_redirected_to equipe_path(assigns(:equipe))
  end

  test "should show equipe" do
    get :show, :id => equipes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => equipes(:one).to_param
    assert_response :success
  end

  test "should update equipe" do
    put :update, :id => equipes(:one).to_param, :equipe => { }
    assert_redirected_to equipe_path(assigns(:equipe))
  end

  test "should destroy equipe" do
    assert_difference('Equipe.count', -1) do
      delete :destroy, :id => equipes(:one).to_param
    end

    assert_redirected_to equipes_path
  end
end
