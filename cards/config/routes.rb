Cards::Application.routes.draw do
  root to: "main#index"

  resources :decks do
    resources :cards
  end

  get "main/rules", :to => "main#rules"

  get "games/new", :to => "games#new"
  post "games/play", :to => "games#play"
  get "games/buy", :to => "games#buy"
  get "games/game_end", :to => "games#game_end"
  get "games/event", :to => "games#event"
  get "games/cargo", :to => "games#cargo"
  get "games/jettison", :to => "games#jettison"
  get "games/station", :to => "games#station"

end
