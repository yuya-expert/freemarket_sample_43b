class Product < ApplicationRecord
  has_many :images
  has_many :likes, dependent: :destroy
  belongs_to :user
  belongs_to :brand
  belongs_to :category

  accepts_nested_attributes_for :images

  enum status:{'---': 0, '新品,未使用': 1, '未使用に近い': 2, '目立った傷や汚れなし': 3, 'やや傷や汚れあり': 4, '傷や汚れあり': 5, '全体的に状態が悪い': 6}, _suffix: true
  enum delivery_fee:{'---': 0, '送料込み(出品者負担)': 1, '着払い(購入者負担)': 2}
  enum shipping_dates:{'---': 0, '1~2日': 1, '2~3日': 2, '4~7日': 3}, _suffix: true
  enum sizes:{'---': 0, S: 1, M: 2, L:3}, _suffix: true
  enum how_to_delivery:{'---': 0, 未定: 1, らくらくメルカリ便: 2, ゆうメール: 3, レターパック: 4}, _suffix: true
  enum shipping_method: [:未定, :らくらくメルカリ便,:ゆうメール,:レターパック,:"普通郵便(定形・定形外)",:クロネコヤマト,:ゆうパック,:クリックポスト,:ゆうパケット]
end
