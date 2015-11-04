class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def edit

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: '成功创建用户。'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: '成功修改用户。'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: '用户已删除。'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :name, :password, :password_confirmation)
    end
end
