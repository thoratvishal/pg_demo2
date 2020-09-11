# Rails.application.routes.draw do
#   devise_for :users
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end


Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :calls
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
