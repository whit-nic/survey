class Admin::ProvincesController < Admin::BaseController
  before_action :set_prov, only: [:show, :edit, :update, :destroy]
  def index
    @provs = Province.all
  end

  def edit

  end

  def new
    @prov = Province.new
  end

  def create
    @prov = Province.new(prov_params)

    if @prov.save
      redirect_to admin_provinces_path, notice: '成功增加省份。'
    else
      render :new
    end
  end

  def update
    if @prov.update(prov_params)
      redirect_to admin_provinces_path, notice: '成功修改省名称。'
    else
      render :edit
    end
  end

  def destroy
    @prov.destroy
    redirect_to admin_provinces_url, notice: '省份已删除。'
  end

  private
    def set_prov
      @prov = Province.find(params[:id])
    end

    def prov_params
      params.require(:province).permit(:name)
    end
end
