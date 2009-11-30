require 'test_helper'

class RolesUsersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => RolesUsers.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    RolesUsers.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    RolesUsers.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to roles_users_url(assigns(:roles_users))
  end
  
  def test_edit
    get :edit, :id => RolesUsers.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    RolesUsers.any_instance.stubs(:valid?).returns(false)
    put :update, :id => RolesUsers.first
    assert_template 'edit'
  end
  
  def test_update_valid
    RolesUsers.any_instance.stubs(:valid?).returns(true)
    put :update, :id => RolesUsers.first
    assert_redirected_to roles_users_url(assigns(:roles_users))
  end
  
  def test_destroy
    roles_users = RolesUsers.first
    delete :destroy, :id => roles_users
    assert_redirected_to roles_users_url
    assert !RolesUsers.exists?(roles_users.id)
  end
end
