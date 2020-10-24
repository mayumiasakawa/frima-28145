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
| Column   | Type    | Options      |
| -------- | ------- | ------------ |
| user_name| string  | null: false  |
| nickname | string  | null: false  |
| birthday | integer | null: false  |
| email    | string  | null: false  |
| password | string  | null: false  | 

### Association
- has_one :item
- has_many :comments

## items テーブル
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| item_name     | string  | null: false |
| item_text     | string  | null: false |
| item_category | integer | null: false |
| item_status   | integer | null: false |
### Association
- belongs_to :user
- has_one :order
- has_many :comments

## orders テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |

### Association
has_one :shipping
belongs_to :item

## shipping テーブル
| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | string  | null: false |
| prefecture     | integer | null: false |
| city           | string  | null: false |
| house_number   | string  | null: false |
| building_name  | string  |             |
| phone_number   | string  | null: false |

### Association
belongs_to :order
