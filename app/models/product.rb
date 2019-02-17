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
  enum shipping_method:{'---': 0, 未定: 1, らくらくメルカリ便: 2, ゆうメール: 3, レターパック: 4}, _suffix: true
  enum delivery_status: [:販売中, :取引中, :取引完了]

  enum search_kind: [:並び替え, :価格の安い順, :価格の高い順, :出品の古い順, :出品の新しい順, :"いいね!の多い順"]
  enum search_size: [:洋服のサイズ, :メンズ靴のサイズ, :レディース靴のサイズ, :スカートのサイズ, :キッズ服のサイズ, :'ベビー・キッズ靴のサイズ', :ベビー服のサイズ, :テレビのサイズ, :カメラレンズのサイズ, :オートバイのサイズ, :ヘルメットのサイズ, :タイヤのサイズ, :スキーのサイズ, :スノーボードのサイズ]
  enum search_price: [:選択してください, :'300 ~ 1000', :'1000 ~ 5000', :'5000 ~ 10000', :'10000 ~ 30000', :'30000 ~ 50000', :'50000 ~']
end
