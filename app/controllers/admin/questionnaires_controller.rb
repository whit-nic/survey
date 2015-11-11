class Admin::QuestionnairesController < Admin::BaseController
  def index
    @questionnaires = Questionnaire.order(id: :desc).page params[:page]
    respond_to do |format|
      format.html
      format.csv {send_data Questionnaire.to_csv, filename: "result.csv"}
    end
  end
end
