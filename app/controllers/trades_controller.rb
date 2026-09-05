class TradesController < ApplicationController
  before_action :require_login

  def index
    @trades = current_user.trades.order(traded_on: :desc)
  end

  def show
    @trade = current_user.trades.find(params[:id])
  end

  def new
    @trade = current_user.trades.build
  end

  def create
    @trade = current_user.trades.build(trade_params)
    if @trade.save
      redirect_to @trade, notice: "取引記録を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @trade = current_user.trades.find(params[:id])
  end

  def update
    @trade = current_user.trades.find(params[:id])
    if @trade.update(trade_params)
      redirect_to @trade, notice: "取引記録を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trade = current_user.trades.find(params[:id])
    @trade.destroy
    redirect_to trades_path, notice: "取引記録を削除しました"
  end

  private

  def trade_params
    params.require(:trade).permit(:stock_name, :stock_code, :trade_type, :shares, :price, :traded_on, :reason)
  end
end