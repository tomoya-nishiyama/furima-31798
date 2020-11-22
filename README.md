# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | date   | null: false |
### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user             | references | null: false |
| name             |   string   | null: false |
| description      |    text    | null: false |
| category_id      |   integer  | null: false |
| condetion_id     |   integer  | null: false | 
| postage_payer_id |   integer  | null: false |
| prefectre_id     |   integer  | null: false |
| handling_time_id |   integer  | null: false |
| price            |   integer  | null: false |
### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|  item  | references | null: false, foreign_key: true |
|  user  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : addresses

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectre_id   | integer    | null: false,                   |
| city           | string     | null: false,                   |
| house_number   | string     | null: false,                   |
| building_name  | string     |                                |
| phone_number   | string     | null: false,                   |
| order          | references | null: false, foreign_key: true |


### Association

- belongs_to :order
