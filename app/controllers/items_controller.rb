class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show,]
  
  def index
       @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @Items.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end   
  end

  private
  def item_params
    params.require(:item).permit(:name, :image,:explanation , :category_id, :status_id,:fee_id, :delivery_source_region_id, :preparetion_day_id,:payment)
  end

end
