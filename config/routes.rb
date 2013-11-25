DefaultRails::Application.routes.draw do
  match '/home', to: redirect('/'), via: 'get'
  root :to => 'high_voltage/pages#show', id: 'home'
end