Rails.application.routes.draw do
  resources :topics, only: [:index, :show]
  resources "projects"
  resources "jobs"
  resources "skills"
  resources "offers"
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: "register"}
  resources :portfolios, except:[:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to: 'portfolios#angular'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'
  get 'gootle', to: 'pages#google'
  get 'social', to: 'pages#social'
  post 'sendemail', to: 'pages#send_email'
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  mount ActionCable.server => '/cable'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
