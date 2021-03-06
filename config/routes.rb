Ect436::Application.routes.draw do

  root('one#home')
  match('/hw2', {:to => 'two#hw2', :via => 'get'})
  match('/hw2p2', {:to => 'two#hw2p2', :via => 'get'})
  match('/hw3', {:to => 'three#hw3', :via => 'get'})
  match('/hw4', {:to => 'four#hw4', :via => 'get'})
  match('/hw4p2', {:to => 'four#hw4p2', :via => 'get'})
  match('/hw5', {:to => 'five#hw5', :via => 'get'})
  match('/hw5p2', {:to => 'five#hw5p2', :via => 'get'})
  match('/nevermelt', {:to => 'final#nevermelt', :via => 'get'})
  match('/proddetail', {:to => 'final#proddetail', :via => 'get'})
  match('/buydone', {:to => 'final#buydone', :via => 'get'})
  match('/badquant', {:to => 'final#badquant', :via => 'get'})
  match('/inventory', {:to => 'final#inventory', :via => 'get'})

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
