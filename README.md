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

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|avatar|string||
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :posts
- has_many :comments
- has_many :favorites


## postsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|description|string|null: false|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user
- has_many :comments
- has_many :favorites



## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|description|string|null: false|
|user_id|integer|foreign_key: true|
|post_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post

