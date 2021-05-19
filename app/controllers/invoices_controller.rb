class InvoicesController < ApplicationController
  before_action :move_to_kaigai_invoice_new, only: [:new, :create]
  before_action :move_to_kaigai_invoice_show, only: [:show]
  def new
    @orders = @kaigai_order.orders
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.valid?
      @invoice.save
      redirect_to kaigai_ship_kaigai_orders_path
    else
      render :new
    end
  end

  def show
    @kaigai_order = @invoice.kaigai_order
    @orders = @kaigai_order.orders
  end

  def order_invoice_update
    @order_invoice = OrderInvoice.find(params[:id])
    @order_kaigai_order = OrderKaigaiOrder.find_by(order_id: @order_invoice.order.id)
    redirect_to new_kaigai_order_invoice_path(@order_kaigai_order.kaigai_order_id) if @order_invoice.update(order_invoice_params)
  end

  private

  def order_invoice_params
    params.permit(:order_invoice_item_quantity, :order_invoice_item_price, :order_invoice_item_name, :order_invoice_item_material)
  end

  def invoice_params
    params.require(:invoice).permit(:invoice_name).merge(user_id: current_user.id, kaigai_order_id: params[:kaigai_order_id])
  end

  def move_to_kaigai_invoice_new
    @kaigai_order = KaigaiOrder.find(params[:kaigai_order_id])
    if current_user.id != @kaigai_order.user_id
      redirect_to user_path(current_user.id)
    end
  end

  def move_to_kaigai_invoice_show
    @invoice = Invoice.find(params[:id])
      if current_user.id == 4
      else
        if current_user.id != @invoice.user_id
          redirect_to user_path(current_user.id)
        end
      end
  end
end

