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

- has_many :items, 
- has_many :comments
- has_many :users_items

## items テーブル

| Column                   | Type      | Options          |
| ----------------------   | ------    | --------------   |
| name                     | string    | null: false      |
| explanation              | text      | null: false      |
| category_id              | integer   | null: false      |
| status_id                | integer   | null: false      |
| fee_id                   | integer   | null: false      |
| delivery_source_region_id| integer   | null: false      |
| preparetion_day_id       | integer   | null: false      |
| user                     | references|foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
has_one : users_item
## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | foreign_key: true              |
| item      | references | foreign_key: true              |

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

| Column                 | Type       | Options           |
| ---------------------- | ---------  | --------------    |
| post_number            | string     | null: false       |
| prefecture_id          | integer    | null: false       |
| municipality           | string     | null: false       |
| address                | string     | null: false       |
| building_name          | string     |                   |
| phone_number           | string     | null: false       |  
| users_item             | references | foreign_key: true | 
### Association


- belongs_to :users_item

