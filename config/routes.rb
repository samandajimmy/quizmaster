Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/answer-it/:id', to: 'answers#answerIt', as: 'answer_it'
  post    '/answer-it/:id', to: 'answers#answerAction'
  resources :users
  resources :questions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
