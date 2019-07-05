# README

## MyLandscape
観光地の風景写真を投稿できるサイトです。ポートフォリオとして作成しました。
URL: http://my-landscape.com/

## 使用技術
- Ruby 2.5.1
- Ruby on Rails 5.2.3
- MySQL2
- SCSS
- jQuery
- Javascript
- Rspec
- AWS
  - EC2
  - S3
  - Route53

## 機能一覧

- ユーザー登録、ログイン機能(devise)
- プロフィール画像、記事画像投稿機能(Amason S3, carrierwave, mini_magick, fog)
- デザイン(bootstrap)
- ページネーション(kaminari)
- 記事投稿、編集機能
- お気に入り機能
- お気に入りランキング機能
- GoogleMap　APIを活用した地図表示機能
- 記事情報と連携したWikipedia情報の表示機能


## DB設計

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


## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|post_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post
