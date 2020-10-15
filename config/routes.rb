Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  resources :users, only: [:index, :show]
  resources :diaries
  resources :groups, only: [:new, :create, :edit, :update, :destroy] do
    resources :chats, only: [:index, :create, :destroy]
  end
  resources :relationships, only: [:index, :create, :destroy]
  root "users#show"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
