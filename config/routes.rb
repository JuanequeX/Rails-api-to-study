Rails.application.routes.draw do
  scope '/api/v1' do
    resources :posts
  end
  # get '/posts', to 'post#index'
  # post '/posts', to: 'posts#create'
  # patch '/posts/:id', to: 'posts#update'
end
