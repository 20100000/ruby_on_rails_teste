Rails.application.routes.draw do
  resources :projetos
  root   "projetos#index"
  resources :tasks
  resources :histories
  devise_for :users
  get "person" => "person#index"
  get '/next/:id', to: 'histories#nextStatus', as: 'nextHistory'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
