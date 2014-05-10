Cards::Application.routes.draw do
  root to: "main#index"

  resources :decks do
    resources :cards
  end

  resources :games
end
