class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, length: {minimum: 6}, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :kana_last, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :kana_first, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birth_day, presence: true
end
