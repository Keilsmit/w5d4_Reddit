Rails.application.routes.draw do
  resources :comments
  resources :tags
  resources :users
  root 'posts#index'
  resources :posts do
    member do
      get 'upvote'
      get 'downvote'
      get 'title_vote'
    end
  end

  resources :sessions, only: [:new, :create]
  get '/logout' => 'sessions#destroy', as: :logout

  resources :tags, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
