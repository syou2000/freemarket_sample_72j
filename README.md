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
- 


## item_imagesテーブル
|column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false|

### Association
- 


## usersテーブル
|column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index:true|
|user_icon|string||
|profile_text|text||
|late_count|integer||

### Association
- 


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
- 


## commentsテーブル
|column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|item_id|string|null: false|
|text|text|null: false|

### Association
- 


## latesテーブル
|column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|text|text||
|late|integer||

### Association
- 


## brandsテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- 


## latesテーブル
|column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|text|text||