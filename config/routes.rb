Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  root to: 'users#index'
  resources :users, only: [:index, :show]
  resources :diaries
  resources :groups do
    resources :chats, only: [:index, :create, :destroy]
  end
  resources :relationships, only: [:index, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
