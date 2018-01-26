Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do
    resources :products, only: %w(index)
    resources :categories, shallow: true do
      resources :products
    end
    resources :users do
      match :profile, on: :collection, via: [:get, :patch]
    end

    post :authenticate, to: 'authentication#authenticate'
  end

end
