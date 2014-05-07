Cards::Application.routes.draw do
  root to: "main#index"

  resources :users do
    resources :cards, only: [:create, :new, :destroy]
  end
end
