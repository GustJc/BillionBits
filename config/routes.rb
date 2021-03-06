BillionBits::Application.routes.draw do


  scope "(:locale)", locale: /pt|en/ do
    root to: 'home_pages#home'

    match 'index', to: "home_pages#home", :as => 'home_page'
    match '', to: "home_pages#home"

    # Home pages
    match 'about', to: 'home_pages#about', via: 'get'
    match 'contact', to: 'home_pages#contact', via: 'get'
    match 'home', to: 'home_pages#home', via: 'get'

    # User and Accounts
    resources :users
    resources :sessions
    match "/signup", to: 'users#new', :as => 'register'
    match "/login", to: 'sessions#new', via: 'get'
    match "/logout", to: 'sessions#destroy'

    # Games
    resources :games
    match "/game/new", to: 'games#new', :as => 'add_games'
    match "/game/add_bits", to: 'games#add_bits', :as => 'add_bits', via: 'post'
    match "/game/remove_bits", to: 'games#remove_bits', :as => 'remove_bits', via: 'post'
    #match "/game/edit/:id", to: 'games#show', :as => 'edit_games'

  end


  root to: 'home_pages#home'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
