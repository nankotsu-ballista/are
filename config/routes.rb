Rails.application.routes.draw do
  root "static_pages#home"
  get  "/help",    to: "static_pages#help"
  get  "/sign",  to: "scores#new"
  get  "/show",  to: "scores#show"
  resources:scores
end
