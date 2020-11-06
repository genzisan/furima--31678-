# テーブル設計

## users テーブル

| column　        | Type  | Options      |
| ----------------|--------|-------------|
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_day       | integer| null: false |

### Association

- has_many :furimas
- has_one  :purchase

## furimas テーブル

| column　    | Type               | Options    |
| -----------|--------------------|-------------|
| furima_name| string             | null: false |
| category   | string             | null: false |
| price      | integer            | null: false |
| days       | integer            | null: false |
| status     | string             | null: false |
| details    | text               | null: false |
| delivery   | integer            | null: false |
| image      | ActiveStorageで実装 | null: false |
| area       | string             | null: false |　　　

### Association

- has_one :purchases
- belongs_to :users

## purchases テーブル

| column　   | Type     | Options    |
| ----------|-----------|-------------|
| comment   | text      | null: false |
| user      | reference |             |
| furima    | reference |             |　　　

### Association

- belongs_to :furimas
- belongs_to :users
- has_one :addresss

## addresss テーブル

| column　        | Type    | Options     |
| ----------------|---------|-------------|
| postal_code     | integer | null: false |
| prefectures     | string  | null: false |
| municipality    | string  | null: false |
| address         | integer | null: false |
| building_name   | string  |             |
| phone_number    | integer | null: false |

### Association

- belongs_to :purchases