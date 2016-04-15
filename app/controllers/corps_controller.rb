class CorpsController < ApplicationController
  layout 'frontend'
  # caches_page :new
  def new
    @corp = Corp.new
  end

  def create
    @corp = Corp.new(corp_params)
    # if verify_rucaptcha?(@corp) && @corp.save
    if @corp.save
      render 'success'
    else
      flash[:danger] = "问卷调查没有填写完整！"
      redirect_to new_corp_path
    end
  end

  private
    def corp_params
      params.require(:corp).permit(
      :q1,
      :q2,
      :q3,
      :q4,
      :q5,
      :q6,
      :q7,
      :q8,
      :q9,
      :q10,
      :q11,
      :q12,
      :q13,
      :q14,
      :q15,
      :q16).merge(ip: request.remote_ip)
    end
end
