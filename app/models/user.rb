class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         
  has_many :items
    # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)(?=.*?[\W_])[!-~]+\z/i.freeze
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d_-]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX ,message: "Password Include both letters and numbers."
 
    with_options presence: true do
    validates :first_name, :family_name,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :first_name_kana,:family_name_kana,format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :name, :birthday
end
    
end