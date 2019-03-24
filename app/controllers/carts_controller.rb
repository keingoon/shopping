class CartsController < ApplicationController

 
  # cartに紐つくcart_itemの一覧を見ます
  def show
    if (quantity = params[:quantity]) && (item_id = params[:cart_item_id])  #cart_item の編集です
      item = CartItem.find_by(id: item_id)
      item.update(quantity: quantity)
    end
    @current_cart = current_cart
    @cart_items = @current_cart.cart_items
    @full_price_items = full_price_items(@cart_items)
  end

  # cartを作成して、商品その中に入れます
  def create
    @current_cart = current_cart
    @cart_item = @current_cart.cart_items.build(quantity: params[:quantity], product_id: params[:product_id])
    if @cart_item.save
      flash[:success] = "カートに追加しました"
      redirect_to cart_path(@current_cart)  # cartのshowにリダイレクトします
    else
      redirect_to products_path # 商品一覧にリダイレクトします
    end 
  end

  # cartに入っているitems(cart_items)を削除する
  def destroy
    CartItem.find_by(id: params[:id]).destroy
    redirect_to cart_path(current_cart)
  end

  
  # カートに入っている商品の値段の合計を計算する
  def full_price_items(items)
    price = 0
    items.each do |item|
      price += item.quantity * item.product.price
    end
    price
  end
end
