class Product < ApplicationRecord
  belongs_to :company
  has_many :cart_items
  validates :name, presence: true, length: {maximum: 50}
  validates :price, presence: true
  mount_uploader :image, ImageUploader

  # 企業名を選択し、それを満たす商品を検索する
  def self.search_for_product(search)
    if search    # searchというparamsがあったら 
      unless search.empty?   #入力があったら
        products = Product.where(company_id: search)
      else   #入力が空だったら
        Product
      end 
    else   #searchというparamsがなかったら
      Product
    end
  end
end
