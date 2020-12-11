class UserSell
  include ActiveModel::Model
  attr_accessor :post_number,:delivery_source_region_id,:city,:address, :building_name,:phone_number,:user_id,:item_id,:token

  
    
    with_options presence: true do
      validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/,message: "は(-)を含めて半角数字で入力して下さい" }
      validates :delivery_source_region_id, numericality: { other_than: 1 ,message: "を選択して下さい" }
      validates :city, :address,:token,:user_id,:item_id
      validates :phone_number,format:{with: /\A[0-9]+\z/,message: "は半角数字で入力して下さい"}  ,length: { maximum: 11 }
    end
      

    def save
      users_items = UsersItem.create(user_id: user_id ,item_id: item_id)
      ShippingAddress.create!(post_number: post_number,delivery_source_region_id: delivery_source_region_id, city: city,address: address, building_name: building_name, phone_number: phone_number, users_items_id: users_items.id)
    end
end


