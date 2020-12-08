class ShippingAddress < ApplicationRecord
  belongs_to :users_item, optional: true
end
