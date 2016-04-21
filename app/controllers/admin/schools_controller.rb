class Admin::SchoolsController < Admin::BaseController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  def index
    @schools = School.includes(:province).all
  end

  def edit

  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to admin_schools_path, notice: '成功增加学校。'
    else
      render :new
    end
  end

  def update
    if @school.update(school_params)
      redirect_to admin_schools_path, notice: '成功修改学校。'
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    redirect_to admin_schools_url, notice: '学校已删除。'
  end

  private
    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :province_id)
    end
end
