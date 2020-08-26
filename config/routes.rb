Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'sign_up/create'
      get 'sign_up/show'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'sign_in/create'
      get 'sign_in/show'
    end
  end
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
