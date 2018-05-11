Rails.application.routes.draw do
  root to: 'calculator#new'

  resource :calculator, only: [:new]
end
