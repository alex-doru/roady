Rails.application.routes.draw do
  root to: 'calculators#new'

  resource :calculator, only: [:new, :create]
end
