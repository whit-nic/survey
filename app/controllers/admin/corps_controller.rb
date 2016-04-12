class Admin::CorpsController < Admin::BaseController
  def index
    @corps = Corp.order(id: :desc).page params[:page]
    respond_to do |format|
      format.html
      format.csv {
        if Corp.count > 0
          send_data "\xEF\xBB\xBF" << Corp.to_csv, filename: "corp_result.csv"
        else
          send_data "\xEF\xBB\xBF" << "当前没有投票数据！", filename: "corp_result.csv"
        end
        }
    end
  end
end
