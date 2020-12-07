class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_source_region
  belongs_to :preparetion_day
  belongs_to :fee
  belongs_to :status
  
  belongs_to :user  
  has_one :users_item

  with_options presence: true do
    validates :payment, format:{with: /\A[0-9]+\z/}
    validates :payment, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 99999999}
    validates :category_id,:delivery_source_region_id, :preparetion_day_id,:fee_id, :status_id,    numericality: { other_than: 1 } 
    validates :name,  length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :image
  end

end
