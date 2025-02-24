Rails.application.routes.draw do
  resources :projects do
    resources :forms
    resources :verified_emails
    resources :verified_emails_verification, only: [ :create ]
  end

  # project email list verification routes
  post "verifi_project_email", to: "verified_emails_verification#post"


  # Authentication routes
  post "sign_in", to: "sessions#create"
  post "sign_up", to: "registrations#create"
  resources :sessions, only: [ :index, :show, :destroy ]
  resource  :password, only: [ :edit, :update ]
  namespace :identity do
    resource :email,              only: [ :edit, :update ]
    resource :email_verification, only: [ :show, :create ]
    resource :password_reset,     only: [ :new, :edit, :create, :update ]
  end

  # update user password from ui
  put "user/password", to: "user#update_password"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
