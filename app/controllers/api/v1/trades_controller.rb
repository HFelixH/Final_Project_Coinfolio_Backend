class Api::V1::TradesController < ApplicationController
  def index
    trades = Trade.all
    render json: trades
  end

  def create
    trade = Trade.create!(trade_params)
    render json: trade, status: :created
  end

  def show
    trade = Trade.find(params[:id])
    render json: trade
  end

  def update
    trade = Trade.find(params[:id])
    trade.update!(trade_params)
    render json: trade
  end

  def destroy
    trade = Trade.find(params[:id])
    trade.destroy
    head :no_content
  end

  private

  def trade_params
    params.permit(:user_id, :stock_id, :quantity, :price, :buy_or_sell)
  end
end
