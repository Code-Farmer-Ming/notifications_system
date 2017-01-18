Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :app_nms,only: :create
  namespace :restaurant do
    resources :app_nms,only: :create
  end
end
