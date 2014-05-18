class ApplicationController < ActionController::Base
  protect_from_forgery

  def discard_cards
    (session[:player_discard] += session[:player_hand]).uniq
    (session[:event_discard] += session[:event_hand]).uniq
  end


  def draw_new_cards(deck, discard, hand, hand_size)
    if session[:"#{deck}"].size >= hand_size
      session[:"#{hand}"] = session[:"#{deck}"].slice!(0..(hand_size-1))
    else
      draw_amount = hand_size - session[:"#{deck}"].size
      session[:"#{hand}"] = session[:"#{deck}"].slice!(0..-1)
      session[:"#{deck}"] = session[:"#{discard}"].shuffle!
      draw_amount.times { session[:"#{hand}"].push(session[:"#{deck}"].slice!(0)) }
      session[:"#{discard}"] = Array.new
    end
  end


  def refresh_buy_deck?
    if session[:buy_hand].size < 3
      draw_amount = 3 - session[:buy_hand].size
      draw_amount.times { session[:buy_hand].push(session[:buy_deck].slice!(0)) }
    end
  end

end
