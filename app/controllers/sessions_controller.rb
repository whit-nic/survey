class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or admin_users_url
      # redirect_to admin_users_url, notice: '登录成功'
    else
      flash.now[:danger] = '账号或者密码错误'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
