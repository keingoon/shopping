class Admin::AdministratorsController < Admin::Base
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  
  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = Administrator.new(admin_params)
    if @administrator.save
      flash[:success] = "管理者作成に成功しました"
      redirect_to admin_administrator_path(@administrator)
    else
      flash[:danger] = "管理者作成に失敗しました"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def admin_params
      params.require(:administrator).permit(:name, :name_kana, :email, :password, :password_confirmation)
    end

    def set_admin
      @administrator = Administrator.find_by(id: params[:id])
    end
end
