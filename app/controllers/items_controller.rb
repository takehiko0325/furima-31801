class ItemsController < ApplicationControlle
  before_action :set_item, only: [:edit, :show, :destroy ]
  before_action :authenticate_user! ,only: [:new]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
   @item = Item.new

  end


  def  show
    
  end

  def  edit
   
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
  private
  def item_params
    params.require(:item).permit(:name, :image,:explanation , :category_id, :status_id,:fee_id, :delivery_source_region_id, :preparetion_day_id,:payment).merge(user_id: current_user.id)
  end
 
  def set_item
    @item = Item.find(params[:id])
  end


  
end
