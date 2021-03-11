class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :delivery
  
  has_one_attached :image
  belongs_to :user
  has_one :order

  

  validates :image, :name, :explain, :category_id, :state_id, :burden_id, :prefecture_id, :delivery_id, :price, presence: true
  validates :category_id, :state_id, :burden_id, :prefecture_id, :delivery_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, message: '半角数字でお願いします。'}
  validates :price, inclusion: {in: 300..9999999, message: '¥300~¥9.999,999でお願いします'}
end


