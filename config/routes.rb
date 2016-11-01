Rails.application.routes.draw do

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
  get '/logout' => 'session#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
