class UserItemController < ApplicationController
  before_action :authenticate_user! 
  def index
    @user_sell   = UserSell.new
    @item = Item.find(params[:item_id])
  end

  def create
    @user_sell   = UserSell.new(user_sell_params)
    if @user_sell.valid?
       @user_sell.save
       redirect_to root_path
    else   
      @item = Item.find(params[:item_id])
      render :index
    end
  end
private

def  user_sell_params
  params.require(:user_sell).permit(:post_number,:delivery_source_region_id,:city,:address, :building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
end


end



