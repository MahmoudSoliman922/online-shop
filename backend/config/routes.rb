# frozen_string_literal: true

Rails.application.routes.draw do
  get '/healthy' => 'application#healthy'
  namespace :v2 do
    resources :login, controller: 'login', only: %i[create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
