Rails.application.routes.draw do
  namespace :listeners do
  get 'github/new'
  end

  namespace :listeners do
  get 'github/create'
  end

  namespace :listeners do
  get 'github/webhook'
  end

  get 'login/new'
  get 'login', to: 'login#create'

  root to: 'home#styleguide'

  get 'styleguide/select_org' => 'home#select_org'
end
