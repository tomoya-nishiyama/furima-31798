class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

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

  validates :price,  numericality: { only_integer: true,greater_than: 300, less_than: 9999999}
  validates :price,  format: { with: /\A[0-9]\w*\z/, message: "販売価格は半角数字を使用してください" }


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condetion
  belongs_to :postage_payer
  belongs_to :prefectre
  belongs_to :handling_time

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condetion_id
    validates :postage_payer_id
    validates :prefectre_id
    validates :handling_time_id
  end
end
