Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :activities, only: [:index, :destroy]
  resources :campers, only: [:index, :show, :create] do resources :activities, only: [:index] end
  resources :signups, only: [:create]
end

# resources :dog_houses do
#   resources :reviews do
#     resources :comments
#   end
# end
