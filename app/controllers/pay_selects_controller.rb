class PaySelectsController < ApplicationController
  def new
    @cards = current_user.cards
    @cards_info = set_cards_info(@cards)
  end

  def create
  end
  

  def set_cards_info(cards)
    cards_info = []
    cards.each do |card|
      token = MyPayJp.retrieve_token(card.token)
      cards_info << { id: card.id, card_last: token[:card][:last4], exp_month: token[:card][:exp_month], exp_year: token[:card][:exp_year], card_name: token[:card][:name] }
    end
    return cards_info
  end
end
