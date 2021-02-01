# カフェ

### カフェの出前を注文するアプリ
![481d4b068c5ccc1dce480d64e663da1c](https://user-images.githubusercontent.com/75296964/106418821-8429b880-649a-11eb-9de8-a726a113c21b.jpg)

# 概要

### お客さんにとってゆっくりくつろげる場所といったらカフェ

### カフェを立ち上げたが、コロナ流行・・・

# テスト用アカウント
- 管理者:owner@fm.co.jp
- お客さん:client1@fm.co.jp

# 利用方法

#### ①新規登録・ログイン
##### こちらのフォームに必要事項を記入のうえ、登録できます。ログインは、メールアドレスとパスワード
<img width="937" alt="78b8666f700bd1d76f4461f57d9088e8" src="https://user-images.githubusercontent.com/75296964/106417883-6196a000-6498-11eb-87c1-2fa4b2ec321d.png">

#### ②オーナーの場合
##### (1) 出品
![demo](https://gyazo.com/02f428d1e20000a6d94c4a308e73a385/raw)
![demo](https://gyazo.com/ab042b44c2cb04802a6744bc49458507/raw)

##### (2) 編集・削除
##### 削除ボタンを押せば削除される
![demo](https://gyazo.com/d6491bc2328f1f43e07425c0489c1377/raw)
![demo](https://gyazo.com/d2e735041e71a384da4cf5f6941476e7/raw)
![demo](https://gyazo.com/7a1178ed9567c020f0700e46a983f409/raw)

#### ③お客さんの場合
##### (1) 注文
![demo](https://gyazo.com/93be73398f37bd600ff07355fc020f0c/raw)

##### (2) コメント投稿
![demo](https://gyazo.com/3e9c68ed432ded65923fb921aa1120ac/raw)

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