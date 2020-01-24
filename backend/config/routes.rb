# frozen_string_literal: true

Rails.application.routes.draw do
  get '/healthy' => 'application#healthy'
  namespace :api do
    namespace :v1 do
      resources :offers, only: [:index] do
        collection do
          get 'paginated_index'
          get 'paginated_filter'
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
