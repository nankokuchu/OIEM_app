class InfosController < ApplicationController
  before_action :move_to_index
  def new
    @info = Info.new
  end

  def create
    @info = Info.new(info_params)
    if @info.valid?
      @info.save
      redirect_to manages_path
    else
      render :new
    end
  end

  private

  def info_params
    params.require(:info).permit(:info_order_tracking_number, :info_order_weight)
  end

  def move_to_index
    if authenticate_user! && current_user.id != 1
      redirect_to root_path
    end
  end
end
