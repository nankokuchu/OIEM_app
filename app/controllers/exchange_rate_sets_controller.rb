class ExchangeRateSetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exchange_rate, only: [:edit, :update, :destroy]
  before_action :move_to_home, only: [:show, :edit, :update]

  def new
    @exchange_rate = ExchangeRateSet.new
  end

  def create
    @exchange_rate = ExchangeRateSet.new(exchange_rate_params)
    if @exchange_rate.valid?
      @exchange_rate.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @exchange_rate.update(exchange_rate_params)
      redirect_to sets_path
    else
      render :edit
    end
  end

  def destroy
    @exchange_rate.destroy
    redirect_to sets_path
  end

  private
  
  def exchange_rate_params
    params.require(:exchange_rate_set).permit(:exchange_country_id, :rate).merge(user_id: current_user.id)
  end

  def set_exchange_rate
    @exchange_rate = ExchangeRateSet.find(params[:id])
  end

  def move_to_home
    redirect_to root_path if current_user.id != @exchange_rate.user.id
  end
end
