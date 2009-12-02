require 'test_helper'

class Admin::WorkSessionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Admin::WorkSessions.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Admin::WorkSessions.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Admin::WorkSessions.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin/work_sessions_url(assigns(:admin/work_sessions))
  end
  
  def test_edit
    get :edit, :id => Admin::WorkSessions.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Admin::WorkSessions.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Admin::WorkSessions.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Admin::WorkSessions.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Admin::WorkSessions.first
    assert_redirected_to admin/work_sessions_url(assigns(:admin/work_sessions))
  end
  
  def test_destroy
    admin/work_sessions = Admin::WorkSessions.first
    delete :destroy, :id => admin/work_sessions
    assert_redirected_to admin/work_sessions_url
    assert !Admin::WorkSessions.exists?(admin/work_sessions.id)
  end
end
