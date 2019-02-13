Rails.application.routes.draw do
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/races/:id', to: 'races#show', as: 'race_show'
end
