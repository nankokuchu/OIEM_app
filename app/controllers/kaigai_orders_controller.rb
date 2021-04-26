class KaigaiOrdersController < ApplicationController
  before_action :set_kaigai_order, only: [:show]
  before_action :set_kaigai_orders, only: [:kaigai_new, :kaigai_ship, :kaigai_sent, :kaigai_cancel, :kaigai_invoice]
  before_action :move_to_mypage, only: [:show]

  def index
  end

  def kaigai_new
  end

  def kaigai_ship
  end

  def kaigai_sent
  end

  def kaigai_cancel
  end

  def kaigai_invoice
  end

  def kaigai_invoice_edit
  end

  def kaigai_invoice_create
  end

  def kaigai_order_over_new
    @kaigai_order_over = KaigaiOrderOver.new
  end

  def kaigai_order_over_create
    @kaigai_order_over = KaigaiOrderOver.new(kaigai_order_id: params[:id])
    if @kaigai_order_over.save
      redirect_to root_path
    else
      render :kaigai_ship
    end
  end

  def show
    @orders = @kaigai_order.orders
  end

  def create
    @new_orders = current_user.orders.where(arrival_status_id: 2)
    @kaigai_order = KaigaiOrder.new(kaigai_params)
    if @kaigai_order.valid?
      @kaigai_order.save
      redirect_to kaigai_orders_path
    end
  end

  private

  def kaigai_params
    params.require(:kaigai_order).permit(:kaigai_order_name, :kaigai_order_price, :kaigai_order_weight,
                                         { order_ids: [] }).merge(user_id: current_user.id)
  end

  def set_kaigai_orders
    @kaigai_orders = current_user.kaigai_orders.all.order(created_at: :desc)
  end

  def set_kaigai_order
    @kaigai_order = KaigaiOrder.find(params[:id])
  end

  def move_to_mypage
    redirect_to user_path(current_user.id) if authenticate_user! && current_user.id != @kaigai_order.user_id
  end
end
