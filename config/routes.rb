Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  require "sidekiq/web"
  mount Sidekiq::Web, at: "/sidekiq"

  resources :app_nms,only: :create
  namespace :restaurant do
    resources :app_nms,only: :create
  end
end
