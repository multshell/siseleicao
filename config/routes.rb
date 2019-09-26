Rails.application.routes.draw do

  get 'panels/index'
  
  get 'defaults/index'
  
  get 'contratos/index'
  
  match 'panels' => 'panels#index', via: 'get'
  match 'admin' => 'defaults#index', via: 'get'
  
  devise_for :users, :skip => [:registrations]
  
  resources :users, except: [:show]
  resources :fornecedores, except: [:show]
  resources :modalidades, except: [:show]
  resources :entidades, except: [:show]
  resources :contratos
  resources :contratos_ativos, only: [:index]
  resources :contratos_finalizados, only: [:index]
  resources :tipo_aditivos, except: [:show]
  resources :aditivos
  
  resources :eleicoes
  resources :candidatos
  resources :urnas
  resources :votacoes
  resources :apuracao_urnas
  
  get 'finaliza/:id' => 'urnas#finaliza', as: :finaliza

  root 'panels#index'

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
