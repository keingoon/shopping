class Admin::CompaniesController < Admin::Base

  def index
    @companies = Company.paginate(page: params[:page])
  end

  def show
    @company = Company.find_by(id: params[:id])
  end
  
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "企業登録に成功しました"
      redirect_to admin_company_path(@company)
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find_by(id: params[:id])
  end

  def update
    @company = Company.find_by(id: params[:id])
    if @company.update_attributes(company_params)
      flash[:success] = "企業編集に成功しました"
      redirect_to admin_company_path(@company)
    else
      render 'edit'
    end  
  end

  def destroy
    Company.find_by(id: params[:id]).destroy
    flash[:success] = "企業を削除しました"
    redirect_to admin_companies_path
  end

  
  private

    def company_params
      params.require(:company).permit(:name, :email)
    end
end
