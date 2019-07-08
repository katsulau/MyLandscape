# README

## MyLandscape
観光地の風景写真を投稿できるサイトです。ポートフォリオとして作成しました。  
URL: http://my-landscape.com/    
![toppage](https://user-images.githubusercontent.com/48985869/60789921-3b652d00-a19b-11e9-8cb5-3c1c1ac39974.jpg)


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
  - ACM
- Circle CI

## 機能一覧

- ユーザー登録、ログイン機能(devise)、ユーザー編集、かんたんログイン機能
  - ユーザー登録
  ![demo](https://gyazo.com/34698a87acb5a88ba9ecbf582128784d)
  ![34698a87acb5a88ba9ecbf582128784d](https://user-images.githubusercontent.com/48985869/60791539-d6abd180-a19e-11e9-9f09-ef34b1f012bb.gif)
  - ログイン
  ![demo](https://gyazo.com/a56dd3ad8e9c60dd0c494c5faaaba244)
  - かんたんログイン
  ![demo](https://gyazo.com/10f32bc44f6700f23cd59e23fcdeaaf1)
  - ユーザー編集
  ![demo](https://gyazo.com/6cf61d7c793436a390dbae036da003cc)
- 記事投稿、編集機能(Amason S3, carrierwave, mini_magick, fog)
  - 投稿
  ![demo](https://gyazo.com/67d299181df264991fe49b487f6c1c7b)
  - 編集
  ![demo](https://gyazo.com/b4cda037c2b334e5353c4ad4533cf551)
- デザイン(bootstrap)
- ページネーション(kaminari)
- お気に入り機能
  ![demo](https://gyazo.com/83840bb3308e4fecd9ec5523930e1d45)
- お気に入りランキング機能
- GoogleMap　APIを活用した地図表示機能
- 記事情報と連携したWikipedia情報の表示機能
- 多言語機能（日本語、英語、スペイン語で表示切り替えができる）
  ![demo](https://gyazo.com/17ae7afe07bc43359ee6e135dd008f14)
