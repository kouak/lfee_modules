ActionController::Routing::Routes.draw do |map|

  map.namespace(:admin) do |admin| 
    admin.root :controller => 'users', :action => 'index'
    admin.resources :users
    admin.resources :promotions
  end

  map.resources :roles, :only => [:show, :index]

  
  map.login "login", :controller => 'user_sessions', :action => 'new'
  map.logout "logout", :controller => 'user_sessions', :action => 'destroy'
  map.myprofile "profil", :controller => 'users', :action => 'profile'
  map.edit_myprofile "profil/edit", :controller => 'users', :action => 'edit'
  
  map.resources :user_sessions
  map.resources :work_sessions, :only => [:show, :index, :create, :new]
  map.resources :secteurs, :only => [:show, :index]
  map.resources :promotions, :only => [:show, :index]
  map.resources :users, :only => [:index, :show, :new, :update] do |users|
    users.resources :work_sessions
  end
  map.resources :equipes, :only => [:show, :index]


  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => 'static', :action => :homepage

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
