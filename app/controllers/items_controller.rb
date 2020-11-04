class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :delete]
  before_action :set_item, only: [:show, :edit, :update]

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
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    item.update(item_params)
    redirect_to item_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :price, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.includes(:user).find(params[:id])
  end

end
