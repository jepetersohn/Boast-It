Rails.application.routes.draw do
  devise_for :users
  resources :boasts do
    member do
      put "like", to: "boasts#upvote"
    end
  end

  resources :users do
    resources :categories do
      resources :boasts
    end
  end

  root "boasts#index"

end
