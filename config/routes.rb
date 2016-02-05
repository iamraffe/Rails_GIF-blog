Rails.application.routes.draw do
  root to: 'posts#high_rated_index'
  resources :posts 
end
