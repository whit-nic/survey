class Admin::BaseController < ApplicationController
  before_action :logged_in_user
  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "请先登录。"
        redirect_to login_url
      end
    end
end
