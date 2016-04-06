class QuestionnairesController < ApplicationController
  layout 'frontend'
  # caches_page :new
  def new
    @questionnaire = Questionnaire.new
    @categories = Category.order(:order_no)
  end

  def create
    @questionnaire = Questionnaire.new(question_params)
    if verify_rucaptcha?(@questionnaire) && @questionnaire.save
      render 'success'
    else
      flash[:danger] = "验证码不正确或者您的输入有误！"
      redirect_to root_path
    end
  end

  private
    def question_params
      params.require(:questionnaire).permit().merge(ip: request.remote_ip).tap do |whitelisted|
        whitelisted[:data] = params[:questionnaire][:data] if params[:questionnaire][:data]
      end
    end
end
