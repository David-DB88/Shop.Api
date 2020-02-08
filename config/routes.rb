Rails.application.routes.draw do
  resources :employees
  resources :shippers
  resources :customers
  resources :suppliers
  resources :categories

  get '/api' => redirect('/swagger/dist/index.html?url=/api-docs.json')
end
