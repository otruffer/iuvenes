Iuvenes::Application.routes.draw do

  resources :verbindungs do
    resources :biercomments do
      collection do
        get 'search'
      end
      end
    resources :paragraphs do
      collection do
        get 'search'
      end
    end
    resources :kants do
      collection do
        get 'search'
      end
    end
    resources :news do
      collection do
        get 'search'
      end
      member do
        get 'new'
      end
    end
    resources :events do
      member do
          get 'join'
          get 'leave'
      end
    end
    member do
      get 'events_archive'
      get 'logo'
      get 'members'
    end
  end
  devise_for :users,
             :controllers  => {
                 :sessions => 'devise_iuvenes',
             }

  resources :users do
    member do
      post 'approve'
      post 'addPushNotification'
    end
  end

  root :to => 'home#index'
  match '/toggle_admin' => 'home#toggle_admin'
  match '/toggle_root' => 'home#toggle_root'
  match '/events' => 'route#anlaesse'
  match '/news' => 'route#news'
  match '/profile' => 'route#profile'
  match '/kants' => 'route#kants'
  match '/api' => 'route#api'
  match '/logo' => 'route#logo'
  match '/biercomments' => 'route#biercomments'
  match '/statuts' => 'route#statuts'
  match '/statuten' => 'route#statuten'
  match '/verbindung' => 'route#verbindung'
  match '/paragraphs' => 'route#statuten'
  match '/bieruhr' => 'route#bieruhr'

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
