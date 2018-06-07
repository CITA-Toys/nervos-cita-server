Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "sessions#new"

  namespace :api do
    namespace :v1 do
      resources :page_infos, only: [:show]
      resources :answers, only: [:create]
    end
  end

  resources :sessions, only: [:new, :create]
  delete :sessions, to: "sessions#destroy"
end
