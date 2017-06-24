Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'messages/inbox#index'

  namespace :messages do
    get '/inbox', to: 'inbox#index'
    get '/sent',  to: 'sent#index'
    get '/drafts', to: 'drafts#index'
  end
  resources :messages, except: :index
end
