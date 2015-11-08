class Admin::CategoriesController < Admin::BaseController
  before_action :set_catetory, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: '成功创建大题。'
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: '成功修改大题。'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: '大题已删除。'
  end

  private
    def set_catetory
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :order_no, questions_attributes: [:id, :name, :field_type, :category_id, :required, :_destroy])
    end
end
