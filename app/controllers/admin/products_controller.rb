class Admin::ProductsController < Admin::Base
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.paginate(page: params[:page])
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "商品の登録に成功しました"
      redirect_to admin_product_url(@product)
    else
      render 'new'
    end
  end

  def edit 
  end

  def update
    if @product.update(product_params)
      flash[:success] = "商品編集に成功しました"
      redirect_to admin_product_url(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "商品を削除しました"
    redirect_to admin_products_path
  end

  private
    def product_params
      if params[:action] == "create"
        params.require(:product).permit(:company_id, :name)
      elsif params[:action] == "update"
        params.require(:product).permit(:name)
      end
    end

    def set_product
      @product = Product.find_by(id: params[:id])
    end
end
