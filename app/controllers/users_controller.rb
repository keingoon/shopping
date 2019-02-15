class UsersController < ApplicationController
  def new
    @user = User.new
  end
   
  def show
    @user = User.find_by(id: params[:id]) 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ようこそshopping-appへ！"
      redirect_to user_url(@user)
      # 登録成功を扱う
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :name_kana, :email, :password, :password_confirmation)
  end
end
