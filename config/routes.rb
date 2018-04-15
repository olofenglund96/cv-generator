Rails.application.routes.draw do

get '/guide', to:'guide#index'
get '/users', to:'users#index'

resources :cvs do
  member do
    get :get_pdf
  end
  resources :experiences
  resources :educations
end

root to: "welcome#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
