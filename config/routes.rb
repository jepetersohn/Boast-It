Rails.application.routes.draw do
  devise_for :users
  resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
  end

  resources :users do
    resources :categories do
      resources :pins
    end
  end

  root "pins#index"

end
