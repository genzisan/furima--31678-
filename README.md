# テーブル設計

## users テーブル

| column　        | Type  | Options      |
| ----------------|--------|-------------|
| email           | string | 　　　　　　　 |
| password        | string | 　　　　　　　 |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_day       | date   | null: false |

### Association

- has_many :furimas
- has_one  :purchase

## furimas テーブル

| column　    | Type               | Options    |
| -----------|--------------------|-------------|
| furima_name| string             | null: false |
| category   | integer            | null: false |
| price      | integer            | null: false |
| days       | integer            | null: false |
| status     | integer            | null: false |
| details    | text               | null: false |
| delivery   | integer            | null: false |
| area       | integer            | null: false |
| user       | reference | foreign_key: true |　

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| column　   | Type     | Options           |
| ----------|-----------|-------------------|
| user      | reference | foreign_key: true |
| furima    | reference | foreign_key: true |　　　

### Association

- belongs_to :furima
- belongs_to :user
- has_one :address

## addresss テーブル

| column　        | Type    | Options     |
| ----------------|---------|-------------|
| postal_code     | string | null: false |
| prefectures     | string  | null: false |
| municipality    | string  | null: false |
| address         | integer | null: false |
| building_name   | string  |             |
| phone_number    | string  | null: false |

### Association

- belongs_to :purchases