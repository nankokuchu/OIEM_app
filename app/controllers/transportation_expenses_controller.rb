class TransportationExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exchange_rate, only: [:edit, :update, :destroy]
  before_action :move_to_home, only: [:show, :edit, :update]

  def new
    @transportation_expense = TransportationExpense.new
  end

  def create
    @transportation_expense = TransportationExpense.new(transportation_expense_params)
    if @transportation_expense.valid?
      @transportation_expense.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if@transportation_expense.update(transportation_expense_params)
      redirect_to sets_path
    else
      render :edit
    end
  end

  def destroy
    @transportation_expense.destroy
    redirect_to sets_path
  end

  private
  
  def transportation_expense_params
    params.require(:transportation_expense).permit(:name, :price).merge(user_id: current_user.id)
  end

  def set_exchange_rate
    @transportation_expense = TransportationExpense.find(params[:id])
  end

  def move_to_home
    redirect_to root_path if current_user.id != @transportation_expense.user.id
  end
end
