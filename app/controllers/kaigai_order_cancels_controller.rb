class KaigaiOrderCancelsController < ApplicationController
  before_action :set_to_kaigai_order  
  before_action :move_to_kaigai_order_index

    def new
      @kaigai_order_cancel = OrderKaigaiOrderCancel.new
    end
  
    def create
      @kaigai_order_cancel = OrderKaigaiOrderCancel.new(koc_params)
      if @kaigai_order_cancel.valid?
        @kaigai_order_cancel.save
        redirect_to root_path
      else
        render 'kaigai_orders/index'
      end
    end
  
    private
  
    def koc_params
      params.permit(:arrival_status_id).merge(user_id: current_user.id, kaigai_order_id: params[:kaigai_order_id])
    end
    
    def set_to_kaigai_order
      @kaigai_order = KaigaiOrder.find(params[:kaigai_order_id])
    end

    def move_to_kaigai_order_index
      if authenticate_user! && current_user.id != @kaigai_order.user_id
        redirect_to kaigai_orders_path
      end
    end
end
