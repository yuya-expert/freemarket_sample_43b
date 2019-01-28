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
|postal_code|integer||
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|tel|integer|null: false|
|encrypted_password|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|self_introduction|content||
|image|string||

### Association
- has_many :products
- has_many :reviews
- has_one :address


## addressesテーブル
|Column|Type|Option|
|------|----|------|
|postal_code|integer||
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||

### Association
- belongs_to :user


## reviewsテーブル
|Column|Type|Option|
|------|----|------|
|rate|integer|null: false|
|comment|content||

### Association
- belongs_to :user


## productsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|detail|content|null: false|
|condition|integer|null: false|
|delivery_fee|integer|null: false|
|area|integer|null: false|
|shipping_dates|integer|null: false|
|price|integer|null: false|
|status|integer|null: false, default: "出品中"|

### Association
- has_many :images
- belongs_to :user
- belongs_to :brand
- belongs_to :large_brand


## imagesテーブル
|Column|Type|Option|
|------|----|------|
|image|string|null: false|

### Association
- belongs_to :product
-


## brandsテーブル
|Column|Type|Option|
|------|----|------|
|list|string|null: false|

### Association
- has_many :products


## large_categoriesテーブル
|Column|Type|Option|
|------|----|------|
|list|string|null: false|

### Association
- has_many :products
- has_many :middle_categories


## middle_categoriesテーブル
|Column|Type|Option|
|------|----|------|
|list|string|null: false|

### Association
- belongs_to :large_category
- has_many :small_categories


## small_categoriesテーブル
|Column|Type|Option|
|------|----|------|
|list|string|null: false|

### Association
- belongs_to :middle_category

