class ManagesController < ApplicationController
  before_action :move_to_index
  
  def m_new
    @m_new_orders = Order.where(arrival_status_id: 1).includes(:user)
    @infos = Info.all
  end

  def new
    @manage_order = ManageOrder.new
    order = Order.find(params[:order_id])
    @manage_tracking_number = Info.where(info_order_tracking_number: order.tracking_number.number).pluck(:info_order_tracking_number)[0]
    @manage_order_weith = Info.where(info_order_tracking_number: order.tracking_number.number).pluck(:info_order_weight)[0]
  end

  def create
    @manage_order = ManageOrder.new(manage_order_params)
    if @manage_order.valid?
      @manage_order.save
      redirect_to m_new_manages_path
    else
      render :new
    end
  end

  private
  def manage_order_params
    params.require(:manage_order).permit(:order_tracking_number, :order_weight, :arrival_status_id).merge(order_id: params[:order_id])
  end

  def move_to_index
    if authenticate_user! && current_user.id != 3
  end
end
