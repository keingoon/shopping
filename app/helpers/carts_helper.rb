module CartsHelper
  # 現在session上にあるカートをセットする
  def current_cart
    unless (cart_id = session[:cart_id])
      cart = Cart.create
      session[:cart_id] = cart.id
    else
      cart ||= Cart.find_by(id: cart_id)
      if cart.nil?  # データベースのcartが期限切れで切れてた場合、@current_cart=nilだからcart作り直して、新しくsessionにcart_idを格納する
        cart = Cart.create
        session[:cart_id] = cart.id
      end
    end
    @current_cart = cart
  end
end
