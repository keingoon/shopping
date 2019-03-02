class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :admin_user, only: :destroy

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

  def edit 
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "更新に成功しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:success] = "ユーザを削除しました"
    redirect_to root_url #ここは仮置き、admin画面作ってから考える
  end

  private
    def user_params
      params.require(:user).permit(:name, :name_kana, :email, :password, :password_confirmation)
    end

    # before アクション
    
    # ログイン済みかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end

    #正しいユーザかどうか確認
    def correct_user 
      @user = User.find_by(id: params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    #管理者かどうか確認する
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
