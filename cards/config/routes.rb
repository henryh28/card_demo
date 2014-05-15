Cards::Application.routes.draw do
  root to: "main#index"

  resources :decks do
    resources :cards
  end

  get "games/new", :to => "games#new"
  post "games/play", :to => "games#play"

end
