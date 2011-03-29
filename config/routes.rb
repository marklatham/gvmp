Gvmp::Application.routes.draw do
  match '/auth/:provider/callback' => 'authentications#create'
  devise_for :users, :path_names => { :sign_up => "register", :sign_in => "login", :sign_out => "logout" }

  root :to => 'communities#home_page'

  resources :authentications
  resources :clippings
  resources :colleagues
  resources :communities do
    resources :websites
    collection do
      get 'search'
      get 'manage'
    end
  end
  resources :faqs
  resources :links
  resources :parameters
  resources :presentations
  resources :proposals
  resources :pubs
  resources :rankings
#  resource :session  # replaced by devise routes
#  resources :users  # replaced by devise routes
  resources :videos
  resources :votes
  resources :websites

  match '/admin',               :to => 'admin#admin',           :as => 'admin'
  match '/t',                   :to => 'admin#terminal',        :as => 'terminal'
  match '/shared_ips',          :to => 'admin#shared_ips',      :as => 'shared_ips'
  match '/gpw',                 :to => 'clippings#gpw',         :as => 'gpw'
  match '/:idstring/horserace', :to => 'communities#horserace', :as => 'horserace'
  match '/horserace/:id',       :to => 'communities#horserace', :as => 'horserace_old'
  match '/:idstring/votes',     :to => 'communities#votes',     :as => 'community_votes'
  match '/mlresume',            :to => 'minimal#mlresume',      :as => 'mlresume'
  match '/temp',                :to => 'minimal#temp',          :as => 'temp'  # Temporary use, not part of website.
  match '/about_contact',       :to => 'public#about_contact',  :as => 'about_contact'
  match '/comdump.yaml',        :to => 'public#comdump',        :as => 'comdump'
  match '/terms',               :to => 'public#terms',          :as => 'terms'
  match '/privacy',             :to => 'public#privacy',        :as => 'privacy'
  match '/how_you_can_help',    :to => 'public#how_you_can_help', :as => 'how_you_can_help'
  match '/ubc2010',             :to => 'public#ubc2010',        :as => 'ubc2010'
  match '/ubcentry',            :to => 'public#ubcentry',       :as => 'ubcentry'
  match '/publications',        :to => 'pubs#index',             :as => 'publications'
  match '/votesummary',         :to => 'votes#summary',         :as => 'votesummary'
 
  match '/:idstring',           :to => 'communities#show',      :as => 'idstring'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #
  # TODO: convert routes to RESTful. Eventually, this should not be used.
  # e.g. communities#vote_for_website  should be refactored into a WebsitesController
  match ':controller(/:action(/:id(.:format)))'
end
