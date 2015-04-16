Rails.application.routes.draw do
  namespace :listeners do
    post 'github/webhook'
    get 'github/create'
    get 'github/new'
  end

  get 'login/new'
  get 'login', to: 'login#create'

  root to: 'home#styleguide'

  get 'styleguide/select_org' => 'home#select_org'
end
