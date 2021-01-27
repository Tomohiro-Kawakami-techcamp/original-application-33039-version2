# テーブル設計

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