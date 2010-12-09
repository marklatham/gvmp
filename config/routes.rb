ActionController::Routing::Routes.draw do |map|
  
  map.root                   :controller => 'communities', :action => 'home_page'
  map.logout    '/logout',   :controller => 'sessions',    :action => 'destroy'
  map.login     '/login',    :controller => 'sessions',    :action => 'new'
  map.register  '/register', :controller => 'users',       :action => 'new'
  map.signup    '/signup',   :controller => 'users',       :action => 'create'
  
  map.resources :clippings
  map.resources :colleagues
  map.resources :communities, :collection => { :search => :get, :manage => :get } do |community|
    community.resources :websites
  end
  map.resources :faqs
  map.resources :links
  map.resources :parameters
  map.resources :presentations
  map.resources :proposals
  map.resources :pubs
  map.resources :rankings
  map.resource :session
  map.resources :users
  map.resources :videos
  map.resources :votes
  map.resources :websites
  
  map.admin            '/admin',               :controller => 'admin',       :action => 'admin'
  map.terminal         '/t',                   :controller => 'admin',       :action => 'terminal'
  map.shared_ips       '/shared_ips',          :controller => 'admin',       :action => 'shared_ips'
  map.gpw              '/gpw',                 :controller => 'clippings',   :action => 'gpw'
  map.horserace        '/:idstring/horserace', :controller => 'communities', :action => 'horserace'
  map.horserace_old    '/horserace/:id',       :controller => 'communities', :action => 'horserace'
  map.community_votes  '/:idstring/votes',     :controller => 'communities', :action => 'votes'
  map.idstring         '/:idstring',           :controller => 'communities', :action => 'show'
  map.mlresume         '/mlresume',            :controller => 'minimal',     :action => 'mlresume'
  map.temp             '/temp',                :controller => 'minimal',     :action => 'temp' # Temporary use, not part of website.
  map.about_contact    '/about_contact',       :controller => 'public',      :action => 'about_contact'
  map.comdump          '/comdump.yaml',        :controller => 'public',      :action => 'comdump'
  map.terms            '/terms',               :controller => 'public',      :action => 'terms'
  map.privacy          '/privacy',             :controller => 'public',      :action => 'privacy'
  map.how_you_can_help '/how_you_can_help',    :controller => 'public',      :action => 'how_you_can_help'
  map.ubc2010          '/ubc2010',             :controller => 'public',      :action => 'ubc2010'
  map.ubcentry         '/ubcentry',            :controller => 'public',      :action => 'ubcentry'
  map.publications     '/publications',        :controller => 'pubs',        :action => 'index'
  map.votesummary      '/votesummary',         :controller => 'votes',       :action => 'summary'
  
  #  Commented out because we were getting spammed. Reactivate when we get spam screens in place: 
  #  map.add_to_community '/communities/:id/add_to', :controller => 'communities', :action => 'add_to'
  
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
  map.connect ':controller/:action' # Why doesn't this work for /clippings/gpw etc? So created map.gpw etc instead.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
