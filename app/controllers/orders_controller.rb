class OrdersController < ApplicationController
  def index
    @order = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to action: :index
    else 
      render action: :new
    end
  end

  private

  def order_params
    params.require(:order)
  end
end
