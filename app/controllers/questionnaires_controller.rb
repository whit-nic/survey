class QuestionnairesController < ApplicationController
  layout 'frontend'
  # caches_page :new
  def new
    @questionnaire = Questionnaire.new
    @categories = Category.order(:order_no)
  end

  def create
    @questionnaire = Questionnaire.new(question_params)
    # if verify_rucaptcha?(@questionnaire) && @questionnaire.save
    if @questionnaire.save
      render 'success'
    else
      flash[:danger] = "问卷调查没有填写完整！"
      redirect_to root_path
    end
  end

  private
    def question_params
      params.require(:questionnaire).permit(:gender,
      :grade,
      :local,
      :hope,
      :learn_status,
      :edu,
      :income,
      :school,
      :subject_type,
      :position,
      :school_position,
      :known).merge(ip: request.remote_ip).tap do |whitelisted|
        whitelisted[:data] = params[:questionnaire][:data] if params[:questionnaire][:data]
      end
    end
end
