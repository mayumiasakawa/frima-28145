class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname, presence: true
    validates :password, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/}, confirmation: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,message: "is invalid. Format is not."}
    validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :first_name, presence: true,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :last_name_kana, presence: true,  format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :first_name_kana, presence: true,  format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :birthday, presence: true
end
