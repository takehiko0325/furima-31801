class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :destroy ]
  before_action :authenticate_user! ,only: [:new,:edit]
  def index
   @items = Item.includes(:user).order("created_at DESC")
  end

  def new
   @item = Item.new

  end


  def  show
    
  end

  def  edit
    unless current_user == @item.user
      redirect_to action: :show
    end
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

  def destroy
    if  @item.user  == current_user
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end 
  end

  def update  
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path
    else 
      render :edit
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :image,:explanation , :category_id, :status_id,:fee_id, :delivery_source_region_id, :preparetion_day_id,:payment).merge(user_id: current_user.id)
  end
 
  def set_item
    @item = Item.find(params[:id])
  end


  
end
