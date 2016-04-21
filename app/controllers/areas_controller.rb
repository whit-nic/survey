class AreasController < ApplicationController
  # layout false
  def index
    # @current_bag = current_customer.bag
    @provinces = Province.all
  end

  def show
    @schools = Province.find(params[:id]).schools
  end
end
