Rails.application.routes.draw do
  root "welcome#index"

  get '/searchs/filter' => "searchs#filter"
  get "/searchs" => "searchs#index"
  post "/searchs/filter" => "searchs#filter", as: :search_filter


  resources :novelties, only: [:index] do
    collection do
      get 'betters'
    end
  end

  resources :centers do
    collection do
      get 'opinions'
      post "images"
      post "delete_images"
      get "admin"
      get "center_admin"
    end
    resources :reviews
  end

  resources :users
  resources :adverts

  resource :session, only: [:new, :create, :destroy]

  get '/logout' => "sessions#destroy", as: "logout"
  get '/notices/centers' => "notices#centers", as: "centers_info"
  get '/notices/trainners' => "notices#trainners", as: "trainners_info"
  # get ':controller(/:action(/:id(.:format)))'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
