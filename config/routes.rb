Rails.application.routes.draw do
  get 'feed', to: 'feed#index'

  namespace :listeners do
    get 'slack/new'
    post 'slack/create'
  end

  namespace :listeners do
    post 'github/webhook'
    post 'github/create'
    get 'github/new'
  end

  get 'login/new'
  get 'login', to: 'login#create'

  root to: 'home#styleguide'

  get 'styleguide/select_org' => 'home#select_org'
end
