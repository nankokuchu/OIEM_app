class KaigaiOrderPaysController < ApplicationController
  before_action :set_to_kaigai_order, only: [:new, :create]
  before_action :move_to_index, only: [:new, :create]

  def new
    @kaigai_order_pay_address = KaigaiOrderPayAddress.new
  end

  def create
    @kaigai_order_pay_address = KaigaiOrderPayAddress.new(kaigai_order_pay_params)
    if @kaigai_order_pay_address.valid?
      pay_order
      @kaigai_order_pay_address.save
      redirect_to kaigai_invoice_kaigai_orders_path
    else
      render :new
    end
  end

  private

  def kaigai_order_pay_params
    params.require(:kaigai_order_pay_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      token: params[:token], user_id: current_user.id, kaigai_order_id: params[:kaigai_order_id]
    )
  end

  def set_to_kaigai_order
    @kaigai_order = KaigaiOrder.find(params[:kaigai_order_id])
  end

  def pay_order
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @kaigai_order.kaigai_order_price,
      card: kaigai_order_pay_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if authenticate_user! && (current_user.id != @kaigai_order.user_id || @kaigai_order.kaigai_order_pay.present? || @kaigai_order.kaigai_order_cancel.present?)
      redirect_to root_path
    end
  end
end
