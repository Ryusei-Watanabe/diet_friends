Rails.application.routes.draw do
  resource :user, only: [:show]
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  resources :diaries
  root "diaries#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
