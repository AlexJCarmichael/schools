Rails.application.routes.draw do
  resources :schools
  root 'welcome#index'
end
