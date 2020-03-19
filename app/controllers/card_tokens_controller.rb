class CardTokensController < ApplicationController
  protect_from_forgery except: :create
  before_action :logged_in_user

  def new
    @cards = current_user.cards
    @cards_info = set_cards_info(@cards)
  end

  # カード情報登録して、現在ログインしているユーザと紐つける
  def create
    #token_id = MyPayJp.create_token(card: params['payjp-token']) #idを返すメソッド
    token_id = params["payjp-token"]
    if (card = Card.create(token: token_id)) && UserCard.create(card_id: card.id, user_id: current_user.id)
      flash[:success] = "カード情報を登録しました"
      redirect_to new_card_token_path
    else
      render 'new'
    end
  end

  def edit 
  end

  def destroy
    current_user.update(card_token_id: nil)
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
