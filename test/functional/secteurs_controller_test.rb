require 'test_helper'

class SecteursControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Secteur.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Secteur.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Secteur.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to secteur_url(assigns(:secteur))
  end
  
  def test_edit
    get :edit, :id => Secteur.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Secteur.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Secteur.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Secteur.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Secteur.first
    assert_redirected_to secteur_url(assigns(:secteur))
  end
  
  def test_destroy
    secteur = Secteur.first
    delete :destroy, :id => secteur
    assert_redirected_to secteurs_url
    assert !Secteur.exists?(secteur.id)
  end
end
