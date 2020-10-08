Rails.application.routes.draw do
  devise_for :users
  # get 'diaries/index'
  # get 'diaries/show'
  # get 'diaries/edit'
  # get 'diaries/new'
  resources :diaries
  root "diaries#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
