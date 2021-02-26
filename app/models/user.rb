class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, length: {minimum: 6}, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/, message: '半角英数字を使ってください'}      
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/}
    validates :kana_last, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :kana_first, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birth_day
  end
end
