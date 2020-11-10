Rails.application.routes.draw do
  get 'tops/index'
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
  # devise_for :users, controllers: {
  #     registrations: 'users/registrations'
  #     sessions: 'users/sessions'
  # }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'tops#index'
  resources :users, only: [:index, :show]
  resources :diaries
  resources :groups do
    resources :chats, only: [:index, :create, :destroy]
  end
  resources :relationships, only: [:index, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
