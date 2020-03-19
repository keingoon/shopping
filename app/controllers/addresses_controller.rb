class AddressesController < ApplicationController
  
  before_action :set_address, only: [:edit, :update]
  
  def new
    @address = Address.new
  end

  def index
    if (address_id = params[:address_id])
      @address = Address.find_by(id: address_id)
      @address.active!
      flash[:success] = "デフォルトの住所を登録しました"
    end
    @addresses = current_user.addresses
  end

  def edit
  end

  def create
    @address = Address.new(params_int(address_params))
    if @address.save 
      UserAddress.create(address_id: @address.id, user_id: current_user.id)
      flash[:success] = "住所を追加しました"
      redirect_to addresses_path 
    else
      render 'new'
    end
  end

  def update
    if @address.update(params_int(address_params))
      flash[:success] = "住所の編集に成功しました"
      redirect_to addresses_path
    else
      render 'edit'
    end
  end

  def destroy
    Address.find_by(params[:id]).destroy
    flash[:success] = "住所を削除しました"
    redirect_to addresses_path
  end


  private
    def address_params
      params.require(:address).permit(:zip, :prefecture_id, :address, :phone_number)
    end

    def params_int(params)
      params.each do |key,value|
        if integer_string?(value)
          params[key] = value.to_i
        end
      end
      return params
    end

    def set_address
      @address = Address.find_by(id: params[:id])
    end
end
