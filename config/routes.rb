Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :plants do
    resources :measurements, :schedules, :settings
  end

  resources :devices
  resources :users

  # chyba chce podpiac plants pod devices. bede musial pozmieniac pathy


  root 'plants#index'
end


# mozna przemyslec shallow nesting
# resources :articles do
#   resources :comments, shallow: true
# end
