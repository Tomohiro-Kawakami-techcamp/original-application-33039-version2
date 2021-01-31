# カフェ

# 概要


# テスト用アカウント


# 利用方法


# 目指したい課題解決

### 1 全般的な課題
  無名のカフェをこのコロナ禍で、どのようにして、売り上げを伸ばすか？

### 2 課題解決
|ユーザーストーリーから考える課題|解決策|
|:---|:---|
|オーナー側からすると、どのくらいの人が利用しているのか知りたいという課題|管理機能をつける。|
|オーナー側からすると、どのお客さんが何時までに届けて欲しいのか、出前先と注文者の電話番号は最低限、知りたいという課題、お客さん側からすると、何を注文したか知りたいという課題|注文履歴機能をつける。|
|オーナー側やお客さんでは、どういった評判なのかわからないという課題|お客さんに口コミを投稿してもらう機能をつけ、口コミを閲覧する機能をつける|

# 実装した機能について

|機能|概要|
|:---|:---|
|ユーザー管理機能|新規登録・ログイン・ログアウトが可能|
|ユーザー詳細機能|管理責任者はお客さんの登録状況、お客さんの名前、Eメールアドレスの個人譲歩を閲覧可能、お客さんは自分のユーザー登録情報を閲覧可能|
|一覧表示機能|出品されたメニューを一覧表示する機能|
|出品機能|管理責任者のみ画像付きで出品可能|
|編集削除機能|管理責任者のみ編集削除が可能|
|注文機能|お客さんのみ注文可能|
|注文履歴機能|管理責任者はお客さん全員が何を注文したか履歴一覧表示する機能、お客さんは何を注文したかの履歴を表示する機能|
|口コミ投稿機能|お客さんのみ口コミを投稿できる機能|
|口コミ一覧機能|どのような口コミが投稿されているか閲覧できる機能|

# 実装予定の機能

- メニューをドリンク、フード、サイドメニューのように分けて表示する機能
- カテゴリー別に分けた後、検索する機能

# ローカルでの動作方法

- $ cd original-application-33039-version2
- $ bundle install
- $ rails db:create
- $ rails db:migrate
- $ rails s
- http://localhost:3000

# DB設計

## users テーブル

| Column             | Type     | Options     |
| ----------------   | -------- | ----------- |
| name               | string   | null: false |
| name_kana          | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| phone_number       | string   |             |
| admin              | boolean  |             |

### Association
- has_many :foods
- has_many :orders
- has_many :comments

## foods テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## comments テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| nickname               | string     | null: false                    |
| message                | text       | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| quantity            | integer    | null: false                    |
| time                | string     | null: false                    |
| user                | references | null: false, foreign_key: true | 
| food                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     |                                |
| prefecture_id       | integer    |                                |
| city                | string     |                                |
| address             | string     |                                |
| building            | string     |                                |
| phone_number        | string     |                                |
| order               | references | null: false, foreign_key: true |

### Association

- belongs_to :order