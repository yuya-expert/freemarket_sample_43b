class Product < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :category

  has_many :images
  has_many :likes, dependent: :destroy

  enum shipping_method: [:未定, :らくらくメルカリ便,:ゆうメール,:レターパック,:"普通郵便(定形・定形外)",:クロネコヤマト,:ゆうパック,:クリックポスト,:ゆうパケット]
end
