require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "users#new"
  end

  resources :dashboards, only: [:show]
  resources :locations, only: [:new, :create, :show] do
    resource :local_user, only: [:new, :create]
  end
end
