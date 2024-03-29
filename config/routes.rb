Rails.application.routes.draw do


devise_for :users
get '/guide', to:'guide#index'


get '/user/cvs' => "cvs#index", as: :user_root

resources :cvs do
  member do
    get :get_pdf
  end
end

resources :users do
  resources :cvs do
    resources :experiences
    resources :educations
  end
end






root to: "welcome#index"

=begin
  devise_scope :user do
  get 'avbryt_reg' => 'devise/registrations#cancel', as: :cancel_user_registration
  post 'anvandare/skapa' => 'registrations#create', as: :user_registration
  get 'anvandare/registrera' => 'devise/registrations#new', as: :new_user_registration

  #sessions
  get 'logga-in' => 'devise/sessions#new', as: :new_user_session
  get 'logga_in', to: redirect('logga-in'), status: 301
  post 'logga-in' => 'devise/sessions#create', as: :user_session
  delete 'logga-ut' => 'devise/sessions#destroy', as: :destroy_user_session

end

=end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
