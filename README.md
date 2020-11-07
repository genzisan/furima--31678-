# テーブル設計

## users テーブル

| column　           | Type  | Options      |
| -------------------|--------|-------------|
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :furimas
- has_many :purchases

## furimas テーブル

| column　    | Type               | Options    |
| -----------|--------------------|-------------|
| furima_name| string             | null: false |
| category_id| integer            | null: false |
| price      | integer            | null: false |
| days_id    | integer            | null: false |
| status_id  | integer            | null: false |
| details    | text               | null: false |
| delivery_id | integer           | null: false |
| prefecture_id  | integer        | null: false |
| user       | references   | foreign_key: true |　

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| column　   | Type     | Options           |
| ----------|-----------|-------------------|
| user      | references | foreign_key: true |
| furima    | references | foreign_key: true |　　　

### Association

- belongs_to :furima
- belongs_to :user
- has_one :address

## addresss テーブル

| column　        | Type    | Options     |
| ----------------|---------|-------------|
| postal_code     | string | null: false |
| prefecture_id  | integer  | null: false |
| municipality    | string  | null: false |
| address         | string | null: false |
| building_name   | string  |             |
| phone_number    | string  | null: false |
| purchase        | references | foreign_key: true |

### Association

- belongs_to :purchase