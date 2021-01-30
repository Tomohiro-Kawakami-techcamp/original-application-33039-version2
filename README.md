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
|オーナー側からすると、どのお客さんが何時までに届けて欲しいのか、出前先と注文者の電話番号は最低限、知りたいという課題|管理機能をつける。|
|お客さん側からすると、何と注文したか知りたいという課題|管理機能をつける。|
|オーナー側やお客さんでは、どういった評判なのかわからないという課題|お客さんにコメントしてもらう機能をつける|

# 実装した機能について

|機能|概要|
|:---|:---|
|ユーザー管理機能|新規登録・ログイン・ログアウトが可能|
|ユーザー詳細機能|管理責任者はお客さんの登録状況、お客さんの名前、Eメールアドレスの個人譲歩を閲覧可能、お客さんは自分のユーザー登録情報を閲覧可能|
|商品出品機能|管理責任者のみ画像付きで出品可能|
|商品一覧表示機能|出品された商品を一覧表示する機能|
|商品詳細表示機能|出品された商品のある一品の詳細が閲覧可能|
|商品編集・削除機能|管理責任者のみ編集削除が可能|
|商品情報編集機能|管理責任者のみ編集可能|
|商品購入機能|お客さんのみ購入可能|
|注文履歴機能|管理責任者はお客さん全員が何を注文したか履歴一覧表示する機能、お客さんは何を注文したかの履歴を表示する機能|
|サービス一提供機能|管理責任者のみサービス提供可能|
|サービス応募者一覧機能|管理責任者は誰が何のサービスに申し込んだかの一覧|
|サービス応募機能|お客さんがサービスに申し込む機能|
|サービス応募履歴機能|お客さんが何のサービスに申し込んだかの一覧|
|コメント投稿機能|お客さんのみサービスやお店に対する意見を投稿できる機能|
|コメント一覧表示機能|管理責任者のみお客さんがどのような意見を投稿したか閲覧できる機能|


# 実装予定の機能


# ローカルでの動作方法


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