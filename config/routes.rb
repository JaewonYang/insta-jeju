Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations' }
  root 'posts#index'
  resources :posts do 
    post 'like', to: 'posts#like', as: :like, on: :member
     # as: 주소에 별칭을 만드는 것
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'mypage', to: 'posts#mypage'

end
