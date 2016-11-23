Rails.application.routes.draw do
  
  root 'home#home'

  get 'home/home'

  post 'employee_sessions/sign_up' => 'employee_sessions#sign_up', as: :sign_up

  post 'employee_sessions/sign_in' => 'employee_sessions#sign_in', as: :sign_in

  delete 'employee_sessions/log_out' => 'employee_sessions#log_out', as: :log_out
  #for employers
  resources :employers, only: [:new , :edit , :destroy]
  get 'employers/sign_in' => 'employers#sign_in' , as: :employer_sign_in
  #for the employer_details
  resources :employer_details, only: [:edit , :update , :show ]
  get 'employer_details/send-verification/:id' => 'employer_details#send_verification' , as: :send_verification_email
  #for the verification
  get 'verification' => 'verification#employ_verification' , as: :employ_verification
  # post 'verification/employee' => 'employee#verify_employ' , as: :verify_employ
  # patch 'verification/employee' => 'employee#verify_employ' , as: :verify_employ
  match 'verification/employee' => 'verification#verify_employ' , via: [:post , :patch] , as: :verify_employ 
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
