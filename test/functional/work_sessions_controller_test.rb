require 'test_helper'

class WorkSessionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => WorkSession.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    WorkSession.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    WorkSession.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to work_session_url(assigns(:work_session))
  end
  
  def test_edit
    get :edit, :id => WorkSession.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    WorkSession.any_instance.stubs(:valid?).returns(false)
    put :update, :id => WorkSession.first
    assert_template 'edit'
  end
  
  def test_update_valid
    WorkSession.any_instance.stubs(:valid?).returns(true)
    put :update, :id => WorkSession.first
    assert_redirected_to work_session_url(assigns(:work_session))
  end
  
  def test_destroy
    work_session = WorkSession.first
    delete :destroy, :id => work_session
    assert_redirected_to work_sessions_url
    assert !WorkSession.exists?(work_session.id)
  end
end
