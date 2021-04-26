class TrackingNumbersController < ApplicationController
  before_action :set_to_order_index_create, only: [:index, :create]
  before_action :set_to_order_update, only: [:update]
  before_action :move_to_root, only: [:index, :create, :update]

  def index
    @tracking_number = if @order.tracking_number.present?
                         @order.tracking_number
                       else
                         TrackingNumber.new
                       end
  end

  def create
    @tracking_number = TrackingNumber.new(tracking_number_create_params)
    if @tracking_number.valid?
      @tracking_number.save
      redirect_to tracking_orders_path
    else
      render :index
    end
  end

  def update
    @tracking_number = TrackingNumber.find(params[:id])
    if @tracking_number.update(tracking_number_update_params)
      redirect_to tracking_orders_path
    else
      render :index
    end
  end

  private

  def tracking_number_create_params
    params.require(:tracking_number).permit(:number).merge(order_id: params[:order_id])
  end

  def tracking_number_update_params
    params.require(:tracking_number).permit(:number, :order_id)
  end

  def set_to_order_index_create
    @order = Order.find(params[:order_id])
    @item = @order.item
  end

  def set_to_order_update
    @order = Order.find(params[:tracking_number][:order_id])
    @item = @order.item
  end

  def move_to_root
    redirect_to root_path if authenticate_user! && current_user.id != @order.user_id
  end
end
