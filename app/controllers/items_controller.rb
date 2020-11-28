class ItemsController < ApplicationController
 
  before_action :move_to_index, except: [:index]
  #def index
       #@items = Item.all
  #end

  #def new
   # @item = Item.new
  #end

  #def create
   # @item = Item.new(item_params)
   # @Items.create(item_params)
    #if @item.save
    #  redirect_to root_path
    #else
    #  render :new
   # end   
  #end

  private
  def item_params
    params.require(:item).permit(:name, :image,:explanation , :category_id, :status_id,:fee_id, :delivery_source_region_id, :preparetion_day_id,:payment)
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
