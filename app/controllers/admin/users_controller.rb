class Admin::UsersController < Admin::Base
  before_action :set_user_for_admin, only: [:show, :destroy]

  def index
    @users = User.paginate(page: params[:page] )
  end

  def show
  end

  def destroy
    @user.destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to admin_users_path
  end

  private
    def set_user_for_admin
      @user = User.find_by(id: params[:id])
    end
end
