class ItemsController < ApplicationController
  def index
@items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Items.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image,:explanation , :category_id, :status_id,:fee_id, :delivery_source_region_id, :preparetion_day_id)
  end

end
