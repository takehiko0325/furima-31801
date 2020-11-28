class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_source_region
  belongs_to :preparetion_day
  belongs_to :fee
  belongs_to :status
  
  belongs_to :user
  
  validates :name, :explanation, :payment,   presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,:delivery_source_region_id, :preparetion_day,:fee_id,:status_id,      numericality: { other_than: 1 } 



end