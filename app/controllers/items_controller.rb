class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @aitem.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def  item_params
    params.require(:item).permit(:name, :text, :status_id, :price, :shipping_fee_id, :prefextuire_id, cheduled_delivery_id,:scheduled_delivery_id,:genre_id)
  end
end
