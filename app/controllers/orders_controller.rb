class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_item = OrderItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_item = OrderItem.new(order_item_params)
    if @order_item.valid?
      pay_order_item
      @order_item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_order_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_item_params[:token],
      currency: 'jpy'
    )
  end

end
