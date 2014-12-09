require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update] do
    resources :password_resets, only: [:edit, :update]
  end
  resources :password_resets, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "sessions#new"
  end

  resources :dashboards, only: [:show]
  resources :locations, only: [:new, :create, :show] do
    resources :users, only: [:new, :create, :index], controller: :local_users
  end
end
