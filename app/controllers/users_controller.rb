class UsersController < ApplicationController
  before_action :move_to_home, only: :show

  def show
    @display_items = Item.where(items_status_id: 1, order_status_id: 1, user_id: current_user.id)
  end

  private

  def move_to_home
    user = User.find(params[:id])
    redirect_to root_path unless user_signed_in? && user.id == current_user.id
  end
end
