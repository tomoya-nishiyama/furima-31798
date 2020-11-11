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

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| user             | string  | null: false |
| name             | string  | null: false |
| description      |  text   | null: false |
| images_id        | integer | null: false |
| category_id      | integer | null: false |
| condetion_id     | integer | null: false | 
| postage_payer_id | integer | null: false |
| prefectre_id     | integer | null: false |
| handling_time_id | integer | null: false |
| price            | integer | null: false |
### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|  item  | references | null: false, foreign_key: true |
|  user  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one : addresses

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures_id | integer    | null: false, foreign_key: true |
| city           | string     | null: false,                   |
| building_name  | string     |                                |
| phone_number   | string     | null: false, nuiqueness: true  |
| purchase       | references | null: false, foreign_key: tyue |


### Association

- belongs_to :purchases
