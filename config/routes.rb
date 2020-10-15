Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  resources :users, only: [:index, :show]
  resources :diaries
  resources :groups do
    resources :chats, only: [:create, :destroy]
  end
  resources :relationships, only: [:index, :create, :destroy]
  root "users#show"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
