class Admin::QuestionnairesController < Admin::BaseController
  def index
    @questionnaires = Questionnaire.order(id: :desc).page params[:page]
  end

  def create
    @questionnaire = Questionnaire.new(question_params)
    if @questionnaire.save
      render 'success'
    else
      render 'new'
    end
  end

  private
    def question_params
      params.require(:questionnaire).permit().merge(ip: request.remote_ip).tap do |whitelisted|
        whitelisted[:data] = params[:questionnaire][:data] if params[:questionnaire][:data]
      end
    end
end
