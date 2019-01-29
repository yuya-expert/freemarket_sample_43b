# DB設計

## usersテーブル
|Column|Type|Option|
|------|----|------|
|nickname|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_ja|string|null: false|
|first_name_ja|string|null: false|
|email|string|null: false, unique: true|
|postal_code|string||
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|phone_number|string|null: false|
|encrypted_password|string|null: false|
|birthday|date|null: false|
|self_introduction|text||
|image|string||

### Association
- has_many :products
- has_many :reviews
- has_one :address


## delivery_addressesテーブル
|Column|Type|Option|
|------|----|------|
|postal_code|string||
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## reviewsテーブル
|Column|Type|Option|
|------|----|------|
|rate|integer|null: false|
|comment|text||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## productsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|detail|text|null: false|
|status|integer|null: false|
|delivery_fee|integer|null: false|
|area|integer|null: false|
|shipping_dates|integer|null: false|
|price|integer|null: false|
|delivery_status|integer|null: false, default: "出品中"|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- has_many :images
- belongs_to :user
- belongs_to :brand
- belongs_to :categories


## imagesテーブル
|Column|Type|Option|
|------|----|------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product


## brandsテーブル
|Column|Type|Option|
|------|----|------|
|list|string|null: false|

### Association
- has_many :products


## categoriesテーブル
|Column|Type|Option|
|------|----|------|
|parent_id|integer||
|name|string|null: false|

### Association
- has_many :products
