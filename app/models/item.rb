class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_source_region
  belongs_to :preparetion_day
  belongs_to :fee
  belongs_to :status
  
  belongs_to :user  
  
  validates :name,:image ,:explanation, :payment,   presence: true
  validates :payment, format:{with: /\A[0-9]+\z/}
  validates :payment, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 99999999, message: "is out of setting range"}
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,:delivery_source_region_id, :preparetion_day_id,:fee_id,      numericality: { other_than: 1 } 



end
