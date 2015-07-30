Rails.application.routes.draw do
  root 'chat#chat'
  namespace :api do
    namespace :v1 do
      scope constraints: {format: :json}, defaults: {format: :json} do
        resources :users, only: [:show] do
          resources :messages, only: [:create, :index]
        end
      end
    end
  end
end
