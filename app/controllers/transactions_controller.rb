class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.includes(:category).all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if Transaction.over_budget?(@transaction.category, @transaction.amount)
      flash[:alert] = 'Budget exceeded for this category!'
      render :new
    else
      if @transaction.save
        redirect_to @transaction, notice: 'Transaction was successfully created.'
      else
        render :new
      end
    end
  end

  private
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :date, :description, :category_id)
  end
end
