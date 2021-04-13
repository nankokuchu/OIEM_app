class OrdersController < ApplicationController
  before_action :set_item, only: [:new, :create]
  before_action :set_order, only: [:edit, :update]
  before_action :move_to_root, only: [:new, :create, :update, :edit]

  def index
    @new_orders = current_user.orders.where(arrival_status_id: 1).includes(:item)
  end

  def tracking
    @new_orders = current_user.orders.where(arrival_status_id: 1).includes(:item)
  end

  def processing
    @new_orders = current_user.orders.where(arrival_status_id: 2).includes(:item)
  end

  def sent
    @sent_orders = current_user.orders.where(arrival_status_id: 3).includes(:item)
  end

  def processed
    @processed_orders = current_user.orders.where(arrival_status_id: 4).includes(:item)
  end

  def cancel
    @cancel_orders = current_user.orders.where(arrival_status_id: 5).includes(:item)
  end

  def new
    @items_order = ItemsOrder.new
  end

  def create
    @items_order = ItemsOrder.new(order_params)
    if @items_order.valid?
      @items_order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(tracking_params)
      redirect_to orders_path
    else
      render :edit
    end
  end

  private

  def order_params
    params.require(:items_order).permit(:price, :quantity, :order_number, :invoice_status_id, :arrival_status_id).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def tracking_params
    params.require(:order).permit(:item_id, :price, :quantity, :order_number, :invoice_status_id, :arrival_status_id,
                                  :tracking_number, :arrival_status_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_order
    @order = Order.find(params[:id])
    @item = @order.item
  end

  def move_to_root
    redirect_to root_path if authenticate_user! && @item.user_id != current_user.id
  end

end
