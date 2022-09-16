Rails.application.routes.draw do
  get 'score/list'
  get 'score/edit'
  post 'score/new' , to: 'score#update'
  get 'main/test'
  post 'main/test'
  get '/' , to: 'main#home'
  post 'main/result', to: 'main#check' 
  get 'main/check'
  get 'main/cal'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
