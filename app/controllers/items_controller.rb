class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_index_item, only: [:index, :search]
  before_action :set_to_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:show, :edit, :update]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def search
    @items = Item.search(params[:keyword])
    @user_items = @items.where(user_id: current_user.id)
    unless @user_items.present?
      flash.now[:alert] = 'キーワードに当てはまる商品がないです'
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :eng_name, :jp_name, :jp_material, :eng_material,
                                 :manufacture_name, :item_selection, :manufacture_item_selection,
                                 :manufacture_url, :selling_price, :ppurchase_price, :purchase_price, :weight,
                                 :items_status_id, :order_status_id, :stock_quantity, :stock_standard).merge(user_id: current_user.id)
  end

  def set_to_item
    @item = Item.find(params[:id])
  end

  def set_index_item
    @display_items = Item.where(items_status_id: 1, user_id: current_user.id)
    @order_items = Item.where(items_status_id: 1, user_id: current_user.id, order_status_id: 2)
    @hiden_items = Item.where(items_status_id: 2, user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path if current_user.id != @item.user.id
  end
end
