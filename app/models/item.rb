class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postage_payer
  belongs_to :handling_time
  belongs_to :category
  belongs_to :condetion
  belongs_to :prefectre
 

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :category_id
    validates :condetion_id
    validates :postage_payer_id
    validates :prefectre_id
    validates :handling_time_id
    validates :price 
  end

  validates :price,  numericality: { only_integer: true, :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999}
  validates :price,  format: { with: /\A[0-9]\w*\z/, message: "販売価格は半角数字を使用してください" }

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condetion_id
    validates :postage_payer_id
    validates :prefectre_id
    validates :handling_time_id
  end
end
