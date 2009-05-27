ActionController::Routing::Routes.draw do |map|
  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.create_user '/create_user', :controller => 'users', :action => 'create'
  map.register '/register', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session

  map.resources :colleagues
  map.resources :communities
  map.resources :faqs
  map.resources :pubs
  map.resources :rankings
  map.resources :votes
  map.resources :websites

  map.home '', :controller => 'welcome', :action => 'index'
  
  map.about_contact '/about_contact', :controller => 'public', :action => 'about_contact'
  map.publications '/publications', :controller => 'pubs', :action => 'index'
  map.terms '/terms', :controller => 'public', :action => 'terms'
  map.privacy '/privacy', :controller => 'public', :action => 'privacy'
  map.how_you_can_help '/how_you_can_help', :controller => 'public', :action => 'how_you_can_help'
  map.admin '/admin', :controller => 'admin', :action => 'admin'
  
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

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.

  map.connect ':controller.:format'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
