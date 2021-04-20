class ManagesController < ApplicationController
  before_action :move_to_index
  
  def m_new_item
    @m_new_orders = Order.where(arrival_status_id: 1).includes(:user)
    @infos = Info.all
  end

  def m_processing
    @m_new_orders = Order.includes(:user)
    @infos = Info.all
  end

  def m_new_order
    @m_new_orders = KaigaiOrder.includes(:user)
  end

  def m_new_order_show
    @kaigai_order = KaigaiOrder.find(params[:id])
    @orders = @kaigai_order.orders.includes(:tracking_number)
  end

  def m_new_order_tracking_new
    @kaigai_tracking_number = KaigaiTracking.new
  end

  def m_new_order_tracking_create
    @kaigai_tracking_number = KaigaiTracking.new(kaigai_tracking_number_params)
    if @kaigai_tracking_number.valid?
      @kaigai_tracking_number.save
      redirect_to m_processing_manages_path
    else
      render :m_new_order_tracking_new
    end
  end

  def m_sent_order
    @m_new_orders = KaigaiOrder.includes(:user)
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
      redirect_to m_new_item_manages_path
    else
      render :new
    end
  end

  private
  def manage_order_params
    params.require(:manage_order).permit(:order_tracking_number, :order_weight, :arrival_status_id).merge(order_id: params[:order_id])
  end

  def kaigai_tracking_number_params
    params.require(:kaigai_tracking).permit(:number).merge(kaigai_order_id: params[:id])
  end

  def move_to_index
    if authenticate_user! && current_user.id != 1
      redirect_to root_path
    end
  end
end
