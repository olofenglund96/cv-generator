Rails.application.routes.draw do

get '/guide', to:'guide#index'
get '/users', to:'users#index'

resources :cvs do
  member do
    get :get_pdf
  end
end

resources :educations
get '/experiences', to:'experiences#new'

#resources :experiences

root to: "welcome#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
