Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/sign_in' => 'sign_in#create'
      get '/sign_in' => 'sign_in#show'
      post '/sign_up' => 'sign_up#create'
      get '/sign_up' => 'sign_up#show'

      ## this generated routes didnt work for me
      # get 'sign_up/create'
      # get 'sign_up/show'
    end
  end
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
