Rails.application.routes.draw do
  resources :schools
  resources :teachers
  resources :students
  root 'welcome#index'
end
