Rails.application.routes.draw do

  mount JsNamespaceRails::Engine => "/js_namespace_rails"

  resources :users

end
