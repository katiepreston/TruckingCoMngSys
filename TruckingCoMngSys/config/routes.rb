Rails.application.routes.draw do
  get 'companies/name:string', to: 'companies#name'

  post "vehicles/maintenanceReports", to: "vehicles#maintenanceReports"

  get "vehicles/maintenanceReportsSetup", to: "vehicles#maintenanceReportsSetup"

  resources :maintenance_items

  resources :maintenance_records

  resources :maintenance_parts

  get "login", to: 'logins#login'

  root "logins#landing"

  post 'auth', to: 'logins#authenticate'

  get "logout", to: "logins#logout"

  get "shipments/incoming", to: "shipments#incoming"

  get "shipments/outgoing", to: "shipments#outgoing"

  post "shipments/addItem", to: "shipments#addItem"

  get "shipments/poEdit", to: "shipments#poEdit"

  post "shipments/lineItemRemove", to: "shipments#lineItemRemove"

  get "shipments/incomingReports", to: "shipments#incoming_reports"

  get "shipments/outgoingReports", to: "shipments#outgoing_reports"

  post "employees/reports", to: "employees#reports"

  get "employees/reportSetup", to: "employees#reportSetup"

  get "vehicles/veh_maint_report", to: "vehicles#veh_maint_report"

  get "employees/archive", to: "employees#archive"

  get "companies/archive", to: "companies#archive"

  get "shipments/archive", to: "shipments#archive"

  get "vehicles/archive", to: "vehicles#archive"

  resources :companies

  resources :repair_parts

  resources :repair_records

  resources :routine_maintenances

  resources :routine_inspections

  resources :vehicle_inspections

  resources :parts

  resources :vehicles

  resources :line_items

  resources :purchase_orders

  resources :shipments

  resources :employees

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
