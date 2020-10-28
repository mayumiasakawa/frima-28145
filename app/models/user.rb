class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_NAMEKANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :nickname, presence: true
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }, confirmation: true
  validates :email, presence: true, uniqueness: true, format: { with:VALID_EMAIL_REGEX, message: 'is invalid. Format is not.' }
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters.' }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters.' }
  validates :last_name_kana, presence: true, format: { with: VALID_NAMEKANA_REGEX, message: 'is invalid. Input full-width katakana characters.' }
  validates :first_name_kana, presence: true, format: { with: VALID_NAMEKANA_REGEX, message: 'is invalid. Input full-width katakana characters.' }
  validates :birthday, presence: true
end
