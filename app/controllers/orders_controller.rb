class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @order_item = OrderItem.new
    if (@item.user_id == current_user.id) || ( @item.order.present?)
      redirect_to root_path
    end
  end
  
  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end

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
