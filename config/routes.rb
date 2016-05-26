Rails.application.routes.draw do
  root 'static_pages#home'
  
  resources :lists do
    resources :items
  end
end
