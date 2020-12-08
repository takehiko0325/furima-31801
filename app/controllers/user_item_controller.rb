class UserItemController < ApplicationController
  before_action :authenticate_user! 
  def index
    @user_sell   = UserSell.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @user_sell   = UserSell.new(user_sell_params)
    if @user_sell.valid?
       pay_item
       @user_sell.save
       redirect_to root_path
    else   
     
      render :index
    end
  end
private

def  user_sell_params
  params.require(:user_sell).permit(:post_number,:delivery_source_region_id,:city,:address, :building_name,:phone_number)
  .merge(token: params[:token])
end

def pay_item
  Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:@item.payment,  
        card: user_sell_params[:token],    
        currency: 'jpy'                 
      ) 
end
end



