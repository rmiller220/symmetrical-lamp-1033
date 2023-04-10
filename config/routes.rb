Rails.application.routes.draw do
  get "customers/:id", to: "customers#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
