# README
# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| family_name     | string | null: false |
| first_name(カナ) | string | null: false |
| family_name(カナ)| string | null: false |
| birthday        | integer| null: false |

### Association

- has_many :items
- has_many :comments


## items テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| image                  | text   | null: false |
| items_name             | string | null: false |
| items_explanation      | string | null: false |
| items_category         | string | null: false |
| items_status           | string | null: false |
| delivery fee           | string | null: false |
| delivery source region | string | null: false |
| preparetion_days       | string | null: false |
| items_value            | integer| null: false |
### Association

- belongs_to :users
- has_many :comments
- has_one: shipping address
- has_one: orders
## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user_id   | references |                                |
| items_id  | references |                                |

### Association
- belongs_to :users
- belongs_to :items


## shipping address テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| post_number            | integer| null: false |
| prefectures            | string | null: false |都道府県
| municipality           | string | null: false |市区町村
| address                | string | null: false |番地
| building_name          | string | null: false |
| phone_number           | integer| null: false |

### Association

- belongs_to :items

# orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| price     | integer    | null: false                    |
