Rails.application.routes.draw do
  root "dashboard#show"
  resources :recordings
  resources :devices
  resources :cards
end
