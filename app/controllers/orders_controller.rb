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
    @kaigai_order = KaigaiOrder.new
  end

  def cancel
    @cancel_orders = current_user.orders.includes(:item)
  end

  def order_cancel_new
    @order_cancel = Ordercancel.new
  end

  def order_cancel_create
    @order_cancel = OrderCancel.new(order_id: params[:id])
    if @order_cancel.save
      redirect_to root_path
    else
      render :kaigai_ship
    end
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
    @kaigai_order = @order.kaigai_orders
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
    params.require(:items_order).permit(:order_name, :total_price, :item_price, :quantity, :order_number, :invoice_status_id, :arrival_status_id, :order_invoice_item_name, :order_invoice_item_material, :order_invoice_item_price).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def tracking_params
    params.require(:order).permit(:item_id, :total_price, :quantity, :order_number, :invoice_status_id, :arrival_status_id,
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
