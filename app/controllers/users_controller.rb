class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end
   
  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_url unless @user.activated? 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "アカウント有効化のためにメールアドレスをチェックしてください"
      redirect_to root_url
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

  private
    def user_params
      params.require(:user).permit(:name, :name_kana, :email, :password, :password_confirmation)
    end
    
end
