# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル
| Column           | Type    | Options      |
| ---------------- | ------- | ------------ |
| first_name       | string  | null: false  |
| last_name        | string  | null: false  |
| first_name_kana  | string  | null: false  |
| last_name_kana   | string  | null: false  |
| nickname         | string  | null: false  |
| birthday         | date    | null: false  |
| email            | string  | null: false  |
| password         | string  | null: false  | 

### Association
- has_many :items
- has_many :comments

## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_image       | text       | null: false                    |
| item_text        | string     | null: false                    |
| item_category_id | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :order
- has_many :comments

## orders テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association
has_one :shipping
belongs_to :item

## shipping テーブル
| Column         | Type        | Options                         |
| -------------- | ----------- | ------------------------------- |
| postal_code    | string      | null: false                     |
| prefecture_id  | integer     | null: false                     |
| city           | string      | null: false                     |
| house_number   | string      | null: false                     |
| building_name  | string      |                                 |
| phone_number   | string      | null: false                     |
| order_id       | references  | null: false, foreign_key: true  |

### Association
belongs_to :order

## comments テーブル
| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| text           | string  | null: false                    |
| user_id        | string  | null: false, foreign_key: true |
| order_id       | string  | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
