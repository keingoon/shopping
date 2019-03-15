class Admin::Base < ApplicationController
  include Admin::SessionsHelper
  layout 'admin'

  before_action :admin_logged_in, if: :should_login?

  def admin_logged_in
    unless admin_logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to admin_login_path
    end
  end

  # アクションに入る前にログインが必要な場合のメソッド
  def should_login?
    true
  end
end
