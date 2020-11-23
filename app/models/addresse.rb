class Addresse < ApplicationRecord

  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectre

end
