Rails.application.routes.draw do
  get '/' => 'welcome#index', as: :index
  post '/' => 'welcome#create', as: :submit
  get "/:id" => "welcome#edit",   as: :support
  delete "/:id" => "welcome#destroy"
  patch "/:id" => "welcome#update"
  put "/:id" => "welcome#completion", as: :completion
end
