Rails.application.routes.draw do
resources :cvs do
  member do
    get :get_pdf
  end
  resources :experiences
  resources :educations
end

root to: "cvs#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
