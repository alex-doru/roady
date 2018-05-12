Rails.application.routes.draw do
  root to: 'calculators#new'


  get  '/api/coordinates' => 'api#coordinates'
  resource :calculator, only: [:new, :create]
end
