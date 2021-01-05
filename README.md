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

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| quantity            | integer    | null: false                    |
| user                | references | null: false, foreign_key: true | 
| food                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## foods テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order