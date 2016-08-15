Rails.application.routes.draw do
  get '/' => 'welcome#index', as: :index
  post '/' => 'welcome#create', as: :submit
  delete "/:id" => "welcome#destroy"
  patch "/:id" => "welcome#update"
  put "/:id" => "welcome#completion", as: :completion
  get "/search" => "welcome#search"
  get "/:id" => "welcome#edit",   as: :support
end
