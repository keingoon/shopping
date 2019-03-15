class Admin::SessionsController < Admin::Base
  def new
  end

  def create
    admin = Administrator.find_by(email: params[:admin_session][:email].downcase)
    if admin && admin.authenticate(params[:admin_session][:password])
      admin_log_in(admin)
      flash[:success] = "ログインに成功しました"
      redirect_back_or admin_companies_path
    else
      flash[:danger] = "パスワードまたはメールアドレスが間違っています"
      redirect_to admin_login_path
    end
  end

  def destroy
    logout
    flash[:success] = "ログアウトしました"
    redirect_to admin_login_path
  end

  private

  # application controller からオーバライドしてきたメソッド、ログインが必要でないのでfalseを返す
    def should_login?
      false
    end
end
