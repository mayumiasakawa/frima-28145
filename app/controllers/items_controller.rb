class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit]
  
  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :price, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
    @category = Category.find_by(id: @item.category_id)
    @status = Status.find_by(id: @item.status_id)
    @shipping_fee = ShippingFee.find_by(id: @item.shipping_fee_id)
    @prefecture = Prefecture.find_by(id: @item.prefecture_id)
    @scheduled_delivery = ScheduledDelivery.find_by(id: @item.scheduled_delivery_id)
  end
end
