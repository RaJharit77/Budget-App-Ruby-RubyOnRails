class ChartsController < ApplicationController
  def index
    @chart_data = Transaction.group_by_day(:date).sum(:amount)
  end
end
