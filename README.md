# README

## freemarket_sample_72j

## itemsテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false, index:true|
|price|string|null: false,index:true|
|explain|text|null: false|
|postage|integer|nullfalse|
|region|string|null:false|
|state|string|null:false|
|shipping_date|integer|null: false|
|size|integer||
|brand_id||
|category_id|integer|null: false|
|user_id|
|item_status|integer|null: false|

### Association
- has_many comments
- belongs_to category
- belongs_to user
- belongs_to brand
- has_many messages
- has_many item_images
- has_one late


## item_imagesテーブル
|column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false|

### Association
- belongs_to item


## usersテーブル
|column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index:true|
|user_icon|string||
|profile_text|text||
|late_count|integer||

### Association
- has_many items
- has_many comments
- has_many messages
- has_many lates
- has_one address
- has_one profiels
- has_one socialprofiles


## profielesテーブル
|column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone_number|integer|null: false, unique: true|
|birthday|datetime|null: false|
|user_id|integer|null:false|

### Association
- belongs_to user


## commentsテーブル
|column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|item_id|string|null: false|
|text|text|null: false|

### Association
- belongs_to user
- belongs_to item 


## latesテーブル
|column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|text|text||
|late|integer||

### Association
- belongs_to user
- belongs_to item



## brandsテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many items
- has_many category through :bland-categorie


## categoriesテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category-level_id|string|null: false|

### Association
- has_many items
- has many category-level2
- has_many blands through :bland-categorie


## bland-categoriテーブル
|column|Type|Options|
|------|----|-------|
|bland_id|references|forgin_key: true, index: true|
|category_id|references|forgin_key, index: true|

### Association
- belongs_to bland
- belongs_to category


## messagesテーブル
|column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|item_id|integer|null: false|
|text|text|null: false|

### Association
- belongs_to user
- belongs_to item


## profielesテーブル
|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
||integer|null: false, index: false|
|city|string|null: false|
|town|string|null: false|
|bulding|string||
|prefecture_num|integer|null: false|

### Association
- belongs_to user