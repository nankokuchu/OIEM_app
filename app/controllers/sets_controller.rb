class SetsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @exchange_rates = current_user.exchange_rate_sets
    @transportation_expenses = current_user.transportation_expenses
  end
end
