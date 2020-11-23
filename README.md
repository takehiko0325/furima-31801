# README
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ---------------    | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items, through: :users_items
- has_many :comments
- has_many :users_items

## items テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| items_name             | string | null: false |
| items_explanation      | text   | null: false |
| items_category         | string | null: false |
| items_status           | string | null: false |
| delivery fee           | string | null: false |
| delivery source region | string | null: false |
| preparetion_days       | string | null: false |
| items_value            | integer| null: false |
| items_id               | integer| null: false |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user_id   | references |                                |
| items_id  | references |                                |

### Association
- belongs_to :user
- belongs_to :item

## users_items テーブル

| Column                 | Type      | Options           |
| ---------------------- | --------- | ------------------|
| item                   |references | foreign_key: true |
| user                   |references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_address テーブル

| Column                 | Type   | Options           |
| ---------------------- | ------ | -----------       |
| post_number            | string | foreign_key: true |
| prefectures            | integer| foreign_key: true |
| municipality           | string | foreign_key: true |
| address                | string | foreign_key: true |
| building_name          | string |                   |
| phone_number           | string | foreign_key: true |  
| shipping_address_id    | integer| null: false       |
### Association

- belongs_to :item
- belongs_to :users_items

