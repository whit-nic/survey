class QuestionnairesController < ApplicationController
  layout 'frontend'
  def new
    @questionnaire = Questionnaire.new
    @categories = Category.order(:order_no)
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
