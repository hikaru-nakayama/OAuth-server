Rails.application.routes.draw do
  get '/authorization' => 'authorization#index'
  post '/decision' => 'authorization#decision'
  post '/token' => 'authorization#token'
end
