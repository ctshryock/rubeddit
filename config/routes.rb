Rubeddit::Application.routes.draw do
  devise_for :users
  get "links/index"

  resources :links do
    get :latest, :on => :collection

    member do
      post :vote_up
      post :vote_down
    end

    resources :comments
    resources :votes 
  end

  resources :users

  root :to => "links#index"
  
end
