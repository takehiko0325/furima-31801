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
  has_many :comments

  with_options presence: true do
    validates :payment, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 99999999, message: "は300~99999999円の範囲で設定して下さい"}   
    validates :category_id,:delivery_source_region_id, :preparetion_day_id,:fee_id, :status_id,    numericality:{ other_than: 1 ,message: "を選択して下さい" }
    validates :name,  length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :image,presence: {message: "を選択して下さい" }
  end
    
    validates :payment, format:{with: /\A[0-9]+\z/,message: "を半角数字で入力して下さい"}
  end
