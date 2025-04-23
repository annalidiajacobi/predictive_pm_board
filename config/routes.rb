Rails.application.routes.draw do
  get "tasks/new"
  get "tasks/create"
  get "tasks/edit"
  get "tasks/update"
  get "tasks/destroy"
  get "tasks/move"
  get "lists/new"
  get "lists/create"
  get "lists/edit"
  get "lists/update"
  get "lists/destroy"
  get "projects/index"
  get "projects/new"
  get "projects/create"
  get "projects/show"
  get "projects/edit"
  get "projects/update"
  get "projects/destroy"
  root 'projects#index'

  resources :projects do
    resources :lists, only: [:new, :create, :edit, :update, :destroy] do
      resources :tasks, only: [:new, :create, :edit, :update, :destroy] do
        member do
          patch :move
        end
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
