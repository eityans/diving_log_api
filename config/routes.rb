Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "test", to: "test#index"

  resources :dive_logs, only: [ :index, :show, :create, :update, :destroy ]
  resources :users, only: [ :create ] do
    resources :dive_logs, only: [ :index ], controller: "dive_logs", action: "user_logs"
  end
  get "users/me", to: "users#me"
  get "users/me/logs", to: "dive_logs#my_logs"
end
