Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/sign_in' => 'sign_in#create'
      get '/sign_in' => 'sign_in#show'
      post '/sign_up' => 'sign_up#create'
      get '/sign_up' => 'sign_up#show'

      post '/users' => 'users#update'
      get '/users' => 'users#show'
      delete '/users' => 'users#destroy'

      get '/students' => 'students#show'
      get '/others' => 'others#show'
      get '/teachers' => 'teachers#show'
      get '/parents' => 'parents#show'
      get '/schools' => 'schools#show'

      patch '/students' => 'students#update'
      patch '/others' => 'others#update'
      patch '/teachers' => 'teachers#update'
      patch '/parents' => 'parents#update'
      patch '/schools' => 'schools#update'

      get '/courses' => 'courses#show'
      post '/courses' => 'courses#create'
      patch '/courses' => 'courses#update'
      delete '/courses' => 'courses#destroy'

      get '/reviews' => 'reviews#show'
      post '/reviews' => 'reviews#create'
      delete '/reviews' => 'reviews#destroy'

      get '/posts' => 'posts#show'
      post '/posts' => 'posts#create'
      patch '/posts' => 'posts#update'
      delete '/posts' => 'posts#destroy'

      get '/educations' => 'educations#show'
      post '/educations' => 'educations#create'
      delete '/educations' => 'educations#destroy'
      patch '/educations' => 'educations#update'

      post '/forgot_password' => 'forgot_password#create'
      resources :forgot_password, only: [:edit]

      ## this generated routes didnt work for me
      # get 'sign_up/create'
      # get 'sign_up/show'
    end
  end
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
