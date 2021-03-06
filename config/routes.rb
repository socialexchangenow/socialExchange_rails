Rails.application.routes.draw do
  resources :individual_offers
  resources :commitments
  resources :business_counter_offers
  resources :charity_offers
  resources :businesses
  resources :charities
  resources :individuals

  root 'welcome#index'

  match 'chatfuel/pushindividualhook', to: 'chatfuel#pushindividualhook', :via => [:get, :post], as: 'chatfuel_pushindividualhook'
  match 'chatfuel/getindividualhook', to: 'chatfuel#getindividualhook', :via => [:get, :post], as: 'chatfuel_getindividualhook'
  match 'chatfuel/getcharitieshook', to: 'chatfuel#getcharitieshook', :via => [:get, :post], as: 'chatfuel_getcharitieshook'
  match 'chatfuel/getcharityoffershook', to: 'chatfuel#getcharityoffershook', :via => [:get, :post], as: 'chatfuel_getcharityoffershook'
  match 'chatfuel/individualofferhook', to: 'chatfuel#individualofferhook', :via => [:get, :post], as: 'chatfuel_individualofferhook'
  match 'chatfuel/reviewindividualoffershook', to: 'chatfuel#reviewindividualoffershook', :via => [:get, :post], as: 'chatfuel_reviewindividualoffershook'
  match 'chatfuel/getbusinesseshook', to: 'chatfuel#getbusinesseshook', :via => [:get, :post], as: 'chatfuel_getbusinesseshook'

  match 'motionai/globalhook', to: 'motionai#globalhook', :via => [:get, :post], as: 'motionai_globalhook'
  match 'motionai/bootstraphook', to: 'motionai#bootstraphook', :via => [:get, :post], as: 'motionai_bootstraphook'
  match 'motionai/selectcharityhook', to: 'motionai#selectcharityhook', :via => [:get, :post], as: 'motionai_selectcharityhook'

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
