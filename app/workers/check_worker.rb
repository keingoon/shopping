class CheckWorker
  # バックグラウンドで、定期的にcartを削除する、データベースから。
  include Sidekiq::Worker
  sidekiq_options queue: :check_worker

  def perform
    puts "ゴリラ"  #確認用　１時間ごとにゴリラを出力します
    Cart.where('created_at <= ?', 80.days.ago).destroy_all
  end

end
