class ItemsController < ApplicationController
  
  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
      redirect_to root_path
    else
      render :new
    end   
  end

  private
  def item_params
    params.require(:item).permit(:name, :image,:explanation , :category_id, :status_id,:fee_id, :delivery_source_region_id, :preparetion_day_id,:payment).merge(user_id: current_user.id)
  end
 

  
end
