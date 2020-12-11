class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items    
  has_one :users_items 
  has_many :comments     
  
    # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)(?=.*?[\W_])[!-~]+\z/i.freeze
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d_-]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX ,message: "は半角英数混合で入力して下さい"

  with_options presence: true do
    validates :first_name, :family_name,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角日本語で入力して下さい"}
    validates :first_name_kana,:family_name_kana,format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カナで入力して下さい"}
    validates :name, :birthday

  end
    
end