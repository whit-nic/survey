class Admin::QuestionnairesController < Admin::BaseController
  def index
    @questionnaires = Questionnaire.order(id: :desc).page params[:page]
    respond_to do |format|
      format.html
      format.csv {
        if Questionnaire.count > 0 && Questionnaire.last.data.present?
          send_data "\xEF\xBB\xBF" << Questionnaire.to_csv, filename: "result.csv"
        else
          send_data "\xEF\xBB\xBF" << "当前没有投票数据！", filename: "result.csv"
        end
        }
    end
  end
end
