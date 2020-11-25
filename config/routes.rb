Rails.application.routes.draw do
  get 'todolists/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'top' => 'homes#top'
post 'todolists' => 'todolists#create'
get 'todolists' => 'todolists#index'
# .../todolists/1や .../todolist/3 に該当する
get 'todolists/:id' => 'todolists#show', as: 'todolist'
end
