Rails.application.routes.draw do
  root to: 'users#index'

  resources :users do
    resources :questions
  end

  resources :questions do
    resources :comments
  end

  get '/log-in' => 'sessions#new'
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
end
