Cards::Application.routes.draw do
  root to: "main#index"

  resources :decks do
    resources :cards
  end

  get "main/rules", :to => "main#rules"

  get "games/new", :to => "games#new"
  post "games/play", :to => "games#play"
  get "games/buy", :to => "games#buy"

end
