Rails.application.routes.draw do
 
  devise_for :users
      devise_scope :user do  
      get '/users/sign_out' => 'devise/sessions#destroy'     
    end
   root 'welcome#index'
   get 'my_portfolio', to: 'users#my_portfolio'
   get 'search_stock', to: 'stocks#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
