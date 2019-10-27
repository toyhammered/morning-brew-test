Rails.application.routes.draw do
  root to: 'newsletters#index'

  get 'stories', to: 'stories#index', as: 'stories'

  resources :newsletters do
    resources :stories, except: [:index]
  end

  post 'newsletters/:id/publish', to: 'newsletters#publish', as: :publish_newsletter
end
