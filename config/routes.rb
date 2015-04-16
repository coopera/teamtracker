Rails.application.routes.draw do
  root to: 'home#styleguide'

  get 'styleguide/select_org' => 'home#select_org'

end
