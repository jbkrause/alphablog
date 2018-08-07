Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blog#home'
  get 'about', to: 'blog#about'
end
