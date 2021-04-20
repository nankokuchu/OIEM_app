class InvoicesController < ApplicationController

  def new
    @kaigai_order = KaigaiOrder.find(params[:kaigai_order_id])
    @orders= @kaigai_order.orders
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
    @invoice = Invoice.find(params[:id])
    @kaigai_order = @invoice.kaigai_order
    @orders = @kaigai_order.orders
  end

  private
  def invoice_params
    params.require(:invoice).permit(:invoice_name).merge(user_id: current_user.id, kaigai_order_id: params[:kaigai_order_id])
  end
end
