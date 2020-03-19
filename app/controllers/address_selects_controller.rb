class AddressSelectsController < ApplicationController
  def new
    @addresses = current_user.addresses
  end

  # 選択したアドレスをsessionに格納。あとでpayを登録するときに使う。あんま良くないと思うけど。
  def create
    if address_id = params[:address_id]
      session[:address_id] = address_id
      redirect_to new_pay_select_path
    else
      render 'new'
    end
  end
end
