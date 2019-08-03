Rails.application.routes.draw do
  resources :working_cards
  post 'card/draw' => 'working_cards#drawOne', as: :draw_card
  resources :coasters
  post 'coaster/draw' => 'coasters#drawOne', as: :draw_coaster
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#home'
  get 'backend' => 'application#backend', as: :backend

end
