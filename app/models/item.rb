class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :date

  validates :name, :explain: :category_id, :state_id, :burden_id, :prefecture_id, :date_id, :price, :user, presence: true
  validates :category_id, :state_id, :burden_id, :prefecture_id, :date_id, numelicality: { other_than: 1 }
end