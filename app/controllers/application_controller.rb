class ApplicationController < ActionController::Base
  require "pry"
  require "sidekiq"
  require "sidekiq-cron"
  require "octicons"
  include SessionsHelper
  include CartsHelper

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

  #数値に変換できるなら変換する
  def integer_string?(str)
    Integer(str)
    true
    rescue ArgumentError
    false 
  end
end
