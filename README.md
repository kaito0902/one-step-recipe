# README

# one-step-recipe
<img width="1440" alt="スクリーンショット 2020-07-28 11 44 40" src="https://user-images.githubusercontent.com/66310212/88613119-be6b6500-d0c7-11ea-99fc-797200501b08.png">

# 主な使用言語
- Haml
- SCSS 
- Ruby

# 機能紹介
- 新規登録・ログインをするとレシピの投稿カテゴリー、レシピの詳細が見れるようになります。
- 新規会員登録、ログインがお済みでない方もレシピの一覧、レシピ投稿者一覧を閲覧可能です。

# ER図
![image](https://user-images.githubusercontent.com/66310212/88615594-38eab380-d0cd-11ea-870a-eefe417d5946.png)

# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|username|string|
|profile|text|
|profile_image_id|string|

### Association
- has_many :recipes, dependent: :destroy

## recipesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|text|null: false|
|time|string|null: false|
|image_id|string|null: false|
|user_id|integer|null: false|

### Association
- belongs_to :user
